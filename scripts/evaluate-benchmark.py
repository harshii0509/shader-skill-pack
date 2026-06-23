#!/usr/bin/env python3
from __future__ import annotations

import json
import math
import re
import sys
from collections import Counter
from pathlib import Path


TOKEN_RE = re.compile(r"[a-z0-9\-\+]+")


def tokenize(text: str) -> list[str]:
    return TOKEN_RE.findall(text.lower())


def tfidf_score(prompt_tokens: list[str], corpus_tokens: list[str], doc_freq: dict[str, int], doc_count: int) -> float:
    prompt_counts = Counter(prompt_tokens)
    corpus_counts = Counter(corpus_tokens)
    score = 0.0
    for token, prompt_tf in prompt_counts.items():
        if token not in corpus_counts:
            continue
        idf = math.log((1 + doc_count) / (1 + doc_freq.get(token, 0))) + 1.0
        score += prompt_tf * corpus_counts[token] * idf
    return score


def load_skill_corpus(skill_dir: Path) -> str:
    parts: list[str] = []
    skill_md = skill_dir / "SKILL.md"
    parts.append(skill_md.read_text())
    refs_dir = skill_dir / "references"
    if refs_dir.exists():
        for ref in sorted(refs_dir.glob("*.md")):
            parts.append(ref.read_text())
    return "\n".join(parts)


def main() -> int:
    root = Path(__file__).resolve().parents[1]
    cases_path = root / "evals" / "shader-benchmark" / "cases.json"
    data = json.loads(cases_path.read_text())

    skills_root = root / "skills"
    skill_names = sorted(p.name for p in skills_root.iterdir() if p.is_dir())
    corpora = {}
    corpus_tokens = {}
    doc_freq: dict[str, int] = {}

    for skill in skill_names:
        text = load_skill_corpus(skills_root / skill)
        corpora[skill] = text.lower()
        tokens = tokenize(text)
        corpus_tokens[skill] = tokens
        for token in set(tokens):
            doc_freq[token] = doc_freq.get(token, 0) + 1

    doc_count = len(skill_names)
    results = []

    for case in data["cases"]:
        prompt_tokens = tokenize(case["prompt"])
        scores = {
            skill: tfidf_score(prompt_tokens, corpus_tokens[skill], doc_freq, doc_count)
            for skill in skill_names
        }
        predicted = max(scores, key=scores.get)
        expected = case["expected_primary_lane"]
        expected_text = corpora[expected]

        mentions_pass = all(term.lower() in expected_text for term in case.get("must_mention", []))
        avoid_pass = all(term.lower() not in expected_text for term in case.get("must_avoid", []))
        refs_pass = all((skills_root / ref).exists() for ref in case.get("expected_first_references", []))
        route_pass = predicted == expected

        results.append(
            {
                "id": case["id"],
                "predicted": predicted,
                "expected": expected,
                "route_pass": route_pass,
                "references_pass": refs_pass,
                "mentions_pass": mentions_pass,
                "avoid_pass": avoid_pass,
                "score": round(scores[predicted], 2),
            }
        )

    route_passes = sum(1 for r in results if r["route_pass"])
    ref_passes = sum(1 for r in results if r["references_pass"])
    mention_passes = sum(1 for r in results if r["mentions_pass"])
    avoid_passes = sum(1 for r in results if r["avoid_pass"])
    total = len(results)

    print("Shader benchmark results")
    print(f"Total cases: {total}")
    print(f"Route pass rate: {route_passes}/{total}")
    print(f"Reference pass rate: {ref_passes}/{total}")
    print(f"Required concept pass rate: {mention_passes}/{total}")
    print(f"Avoidance pass rate: {avoid_passes}/{total}")
    print("")

    for result in results:
        status = "PASS" if all(
            result[key] for key in ("route_pass", "references_pass", "mentions_pass", "avoid_pass")
        ) else "FAIL"
        print(
            f"{status} {result['id']} expected={result['expected']} predicted={result['predicted']} "
            f"score={result['score']}"
        )

    if all(
        all(result[key] for key in ("route_pass", "references_pass", "mentions_pass", "avoid_pass"))
        for result in results
    ):
        return 0
    return 1


if __name__ == "__main__":
    sys.exit(main())

# Shader Skill Pack

A reusable 6-skill suite for shader work across routing, fundamentals, stylization, lighting, volumetrics, and platform decisions.

This pack distills the Tier 1 and Tier 2 shader articles from Maxime Heckel's blog into reusable Codex and Claude skills.

Original shader research, explanations, and article examples are credited to Maxime Heckel. This repository packages original skill instructions derived from studying his writing; it does not republish the original articles or claim authorship of the underlying shader techniques.

## Quick Start

Install the pack with the `skills` CLI:

```bash
npx skills add harshii0509/shader-skill-pack
```

Discovery page:

- [skills.sh/harshii0509/shader-skill-pack](https://skills.sh/harshii0509/shader-skill-pack)

GitHub repo:

- [github.com/harshii0509/shader-skill-pack](https://github.com/harshii0509/shader-skill-pack)

If the `skills.sh` page or badge does not appear immediately after release, that is usually indexing or cache delay rather than a repo problem.

## Included Skills

- `shader-techniques` - router skill that picks the right shader lane
- `shader-fundamentals` - core GLSL, SDF, raymarching, uniforms, and particle foundations
- `shader-stylization` - halftone, CMYK, dithering, painterly, and graphic post FX looks
- `shader-lighting` - refraction, dispersion, Fresnel shaping, caustics, and projected-light effects
- `shader-volumetrics` - clouds, light shafts, scattering, skies, and planetary atmosphere
- `shader-platforms` - React Three Fiber, render targets, FBO particles, TSL, WebGPU, and compute decisions

The canonical installable source lives in [`skills/`](./skills).

## Install In Codex

Use Codex's installer skill against the public GitHub tree URLs once this repo is published:

```text
Use $skill-installer to install:
https://github.com/harshii0509/shader-skill-pack/tree/main/skills/shader-techniques
https://github.com/harshii0509/shader-skill-pack/tree/main/skills/shader-fundamentals
https://github.com/harshii0509/shader-skill-pack/tree/main/skills/shader-stylization
https://github.com/harshii0509/shader-skill-pack/tree/main/skills/shader-lighting
https://github.com/harshii0509/shader-skill-pack/tree/main/skills/shader-volumetrics
https://github.com/harshii0509/shader-skill-pack/tree/main/skills/shader-platforms
```

After install, restart Codex so the new skills are picked up.

## Install In Claude

Copy the six folders from `skills/` into your Claude skills directory:

```bash
cp -R skills/shader-techniques ~/.claude/skills/
cp -R skills/shader-fundamentals ~/.claude/skills/
cp -R skills/shader-stylization ~/.claude/skills/
cp -R skills/shader-lighting ~/.claude/skills/
cp -R skills/shader-volumetrics ~/.claude/skills/
cp -R skills/shader-platforms ~/.claude/skills/
```

## How To Update

Updates are not automatic. Publishing a new version makes it available, but existing users still need to refresh their local copy.

- If you installed with the `skills` CLI:

```bash
npx skills check
npx skills update
```

Then restart your agent so it reloads the updated skill files.

- If you installed by copying folders into Codex or Claude:
  copy the updated `skills/shader-*` folders over your existing local install again.

- If you are developing from this repo locally:

```bash
./scripts/sync-local-installs.sh
```

That syncs the canonical source into your local Codex and Claude skill directories.

## Example Usage

- `$shader-techniques I want a stylized shader scene, but I am not sure whether this is a post-processing, raymarching, or WebGPU problem yet.`
- `$shader-fundamentals Teach me the cleanest path to my first SDF raymarched scene.`
- `$shader-stylization Add a CMYK halftone pass with rotated channels and moire control.`
- `$shader-lighting Help me build refractive glass with chromatic dispersion and stronger Fresnel shaping.`
- `$shader-volumetrics I want dreamy clouds with better self-shadowing and a path toward atmospheric scattering.`
- `$shader-platforms Should I solve this with render targets, FBO particles, or move to TSL and WebGPU compute?`

## Benchmark

The benchmark suite lives in [`evals/shader-benchmark/`](./evals/shader-benchmark):

- `cases.json`: 10 benchmark prompts
- `rubric.md`: scoring rules
- `results-template.md`: empty run template
- `results-2026-06-01.md`: first packaged baseline

The harness is answer-only by default:

```text
Answer only. Route to the best shader lane, load the first references, then give a short recommendation with the main tradeoff.
```

## Attribution

This repo ships the skill pack only. The study sources that informed it are credited in [ATTRIBUTION.md](./ATTRIBUTION.md) and are not redistributed here. Maxime Heckel's blog is the primary study source for the techniques and article structure that informed this pack.

## Maintainer Commands

- Validate the full suite:

```bash
./scripts/validate-all-skills.sh
```

- Run the release sanity check:

```bash
./scripts/release-check.sh
```

- Run the benchmark:

```bash
./scripts/run-evals.sh
```

- Sync local Codex and Claude installs from the canonical source:

```bash
./scripts/sync-local-installs.sh
```

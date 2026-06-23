# Shader Benchmark Rubric

This benchmark is a structural routing and source-grounding eval for the shader skill pack.

It does not prove live model behavior on its own. It checks whether:

- the right skill lane is the most relevant one for the benchmark prompt
- the referenced files for that lane exist
- the expected lane actually contains the required concepts
- clearly irrelevant concepts do not dominate the lane

## Dimensions

### Route

Pass when:

- the benchmark prompt routes to the expected skill

Fail when:

- the prompt matches the wrong lane more strongly than the expected lane

### Reference coverage

Pass when:

- the expected first references exist inside the skill pack

Fail when:

- the pack names references that are missing

### Concept coverage

Pass when:

- the expected lane contains the concepts the prompt depends on

Fail when:

- the lane is too generic or too thin to support the prompt

### Separation

Pass when:

- obviously unrelated concepts are not present in the expected lane

Fail when:

- the lane is muddy enough that unrelated domains leak into it

## Gate

Hard gate:

- every benchmark case must pass all four dimensions

Soft interpretation:

- a passing benchmark means the pack is well-structured and source-grounded
- a failing benchmark means the skill text or the lane boundaries need revision before trusting the pack

---
name: shader-techniques
description: Route shader requests into the right implementation lane. Use when Codex needs to decide between shader fundamentals, stylized post-processing, refraction or caustics, volumetric or atmospheric rendering, or platform-specific React Three Fiber, render-target, TSL, and WebGPU workflows distilled from Maxime Heckel's shader articles.
---

# Shader Techniques

Use this skill when the request is broad, exploratory, or combines multiple shader families.
Use it first when the user is not sure whether the effect is a raymarching problem, a post-processing problem, a lighting problem, a volumetric problem, or a WebGPU problem.

## Quick Start

1. Name the dominant lane before proposing code.
2. Decide whether the user needs:
   - foundational shader construction
   - stylization or post-processing
   - light or material behavior
   - volumetrics or atmosphere
   - platform and pipeline guidance
3. Load the first matching reference from [references/article-map.md](references/article-map.md).
4. Recommend the smallest rendering architecture that can still grow with the effect.

This lane is explicitly for routing and choosing between shader families before committing to implementation.

## Routing Cues

- Route to `shader-fundamentals` for SDFs, raymarching, uniforms, noise, particles, and "teach me shaders" requests.
- Route to `shader-stylization` for halftone, dithering, painterly, Moebius, comic, CRT, or graphic post-processing looks.
- Route to `shader-lighting` for refraction, dispersion, caustics, Fresnel-driven material shaping, or light projection.
- Route to `shader-volumetrics` for clouds, shafts, fog-like raymarching, atmospheric scattering, sky rendering, or LUT-based atmosphere work.
- Route to `shader-platforms` for React Three Fiber integration, render targets, FBO particles, TSL, WebGPU, or compute-shader decisions.
- Stay in `shader-techniques` if the user is still choosing between raymarching, post-processing, volumetrics, lighting, and WebGPU.

## Pitfalls

- Do not jump to WebGPU when the user only needs a fragment pass.
- Do not route stylized post-processing prompts into volumetrics just because the scene is 3D.
- Do not treat a lighting problem as a fundamentals prompt if the hard part is light transport or material response.

## When To Read References

- Read [references/article-map.md](references/article-map.md) when you need source-to-skill mapping or the fastest lane decision.

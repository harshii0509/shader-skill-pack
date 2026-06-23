---
name: shader-lighting
description: Implement light-driven and material-driven shader effects. Use when Codex needs refraction, chromatic dispersion, Fresnel shaping, caustics, normals-based light projection, glossy or translucent material behavior, or other shader-light interactions based on Maxime Heckel's lighting-focused articles.
---

# Shader Lighting

Use this skill when the hard part is how light bends, separates, projects, or shapes the material response.

## Quick Start

1. Decide whether the user is solving a material problem or a projected-light problem.
2. Identify the core driver:
   - refraction
   - dispersion
   - Fresnel shaping
   - caustics
   - normal-driven distortion
3. Keep the color model explicit. Lighting work often fails because the math and color handling drift apart.
4. Start from a stable baseline before adding polish such as shininess or animated detail.

## Core Workflow

### 1. Separate geometry response from color treatment

Get the directional and geometric behavior right first, then tune the color separation, saturation, or energy feel.

### 2. Build the light path proxy

- For refraction, establish the sampling direction and distortion first.
- For dispersion, split channels only after the base refraction reads.
- For caustics, derive or approximate the surface normals and projection behavior before texturing the light.

### 3. Protect readability

Too much distortion or color spread quickly stops looking like glass or believable light.

## Pitfalls

- Do not oversaturate dispersion before the refracted form is stable.
- Do not fake caustics as a random texture without respecting normal flow or projection logic.
- Do not route cloud or sky prompts here just because light is involved.

## When To Read References

- Read [references/light-material-recipes.md](references/light-material-recipes.md) for refraction, dispersion, Fresnel, caustics, projection, normals, and color-space guidance.

## Attribution

Distilled from [Maxime Heckel's](https://blog.maximeheckel.com) shader writing.

Primary sources:
- [Refraction, Dispersion, and Other Shader Light Effects](https://blog.maximeheckel.com/posts/refraction-dispersion-and-other-shader-light-effects/)
- [Shining a Light on Caustics with Shaders and React Three Fiber](https://blog.maximeheckel.com/posts/caustics-in-webgl/)

---
name: shader-volumetrics
description: Implement volumetric and atmospheric shader effects. Use when Codex needs clouds, volumetric raymarching, light shafts, scattering, shadowed participating media, skies, sunsets, planetary atmosphere, or LUT-based atmospheric rendering distilled from Maxime Heckel's volumetric and sky-rendering articles.
---

# Shader Volumetrics

Use this skill when the image depends on light moving through volume rather than just bouncing off a surface.

## Quick Start

1. Decide whether the request is about a local volume, a full sky model, or both.
2. Start with the cheapest volume representation that can express the look.
3. Separate shape, lighting, and performance work:
   - density and noise
   - scattering and shadow
   - optimization and step count
4. Validate the silhouette before chasing physically richer lighting.

## Core Workflow

### 1. Define the volume

- Clouds need coherent density fields and believable macro shape before detail noise.
- Atmospheric skies need a stable gradient and scattering model before planet-scale nuance.

### 2. Add light transport

- Use shadowing and scattering to give the volume structure.
- Add shafts, glow, or sunset coloration only after the density read is convincing.

### 3. Scale to performance

Volumetric work gets expensive fast. Reduce steps, bound the effect, or move to LUT strategies when the domain is broad.

## Pitfalls

- Do not chase physically accurate scattering before the density field is readable.
- Do not use heavy volumetric loops when a LUT or post-process light shaft solves the brief.
- Do not route graphic post-processing prompts here.

## When To Read References

- Read [references/atmosphere-and-volume.md](references/atmosphere-and-volume.md) for clouds, scattering, light shafts, sky models, planetary atmosphere, shadow mapping, and LUT strategies.

## Attribution

Distilled from [Maxime Heckel's](https://blog.maximeheckel.com) shader writing.

Primary sources:
- [Real-time Dreamy Cloudscapes with Volumetric Raymarching](https://blog.maximeheckel.com/posts/real-time-cloudscapes-with-volumetric-raymarching/)
- [On Shaping Light](https://blog.maximeheckel.com/posts/shaping-light-volumetric-lighting-with-post-processing-and-raymarching/)
- [On Rendering the Sky, Sunsets, and Planets](https://blog.maximeheckel.com/posts/on-rendering-the-sky-sunsets-and-planets/)

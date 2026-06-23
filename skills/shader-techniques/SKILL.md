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

- Route to `shader-fundamentals` for SDFs, raymarching, uniforms, noise, fBm, domain warping, particles, and "teach me shaders" requests.
- Route to `shader-stylization` for halftone, dithering, painterly, Moebius, comic, CRT, bloom, glow, lens flare, or graphic post-processing looks.
- Route to `shader-lighting` for refraction, dispersion, caustics, Fresnel-driven material shaping, or light projection.
- Route to `shader-volumetrics` for clouds, shafts, fog, depth-based atmosphere, atmospheric scattering, sky rendering, Mie/Rayleigh scattering, or LUT-based atmosphere work.
- Route to `shader-platforms` for React Three Fiber integration, render targets, FBO particles, drei ecosystem helpers, TSL, WebGPU, or compute-shader decisions.
- Stay in `shader-techniques` if the user is still choosing between raymarching, post-processing, volumetrics, lighting, and WebGPU.

## Pitfalls

- Do not jump to WebGPU when the user only needs a fragment pass.
- Do not route stylized post-processing prompts into volumetrics just because the scene is 3D.
- Do not treat a lighting problem as a fundamentals prompt if the hard part is light transport or material response.

## When To Read References

- Read [references/article-map.md](references/article-map.md) when you need source-to-skill mapping or the fastest lane decision.

## Attribution

Distilled from [Maxime Heckel's](https://blog.maximeheckel.com) shader writing.

Primary sources:
- [Painting with Math: A Gentle Study of Raymarching](https://blog.maximeheckel.com/posts/painting-with-math-a-gentle-study-of-raymarching/)
- [The Study of Shaders with React Three Fiber](https://blog.maximeheckel.com/posts/the-study-of-shaders-with-react-three-fiber/)
- [Shades of Halftone](https://blog.maximeheckel.com/posts/shades-of-halftone/)
- [The Art of Dithering and Retro Shading for the Web](https://blog.maximeheckel.com/posts/the-art-of-dithering-and-retro-shading-web/)
- [Post-Processing Shaders as a Creative Medium](https://blog.maximeheckel.com/posts/post-processing-as-a-creative-medium/)
- [Moebius-style Post-Processing and Other Stylized Shaders](https://blog.maximeheckel.com/posts/moebius-style-post-processing/)
- [On Crafting Painterly Shaders](https://blog.maximeheckel.com/posts/on-crafting-painterly-shaders/)
- [Refraction, Dispersion, and Other Shader Light Effects](https://blog.maximeheckel.com/posts/refraction-dispersion-and-other-shader-light-effects/)
- [Shining a Light on Caustics with Shaders and React Three Fiber](https://blog.maximeheckel.com/posts/caustics-in-webgl/)
- [Real-time Dreamy Cloudscapes with Volumetric Raymarching](https://blog.maximeheckel.com/posts/real-time-cloudscapes-with-volumetric-raymarching/)
- [On Shaping Light](https://blog.maximeheckel.com/posts/shaping-light-volumetric-lighting-with-post-processing-and-raymarching/)
- [On Rendering the Sky, Sunsets, and Planets](https://blog.maximeheckel.com/posts/on-rendering-the-sky-sunsets-and-planets/)
- [Field Guide to TSL and WebGPU](https://blog.maximeheckel.com/posts/field-guide-to-tsl-and-webgpu/)
- [Beautiful and Mind-Bending Effects with WebGL Render Targets](https://blog.maximeheckel.com/posts/beautiful-and-mind-bending-effects-with-webgl-render-targets/)
- [The Magical World of Particles with React Three Fiber and Shaders](https://blog.maximeheckel.com/posts/the-magical-world-of-particles-with-react-three-fiber-and-shaders/)
- [Building a Vaporwave Scene with Three.js](https://blog.maximeheckel.com/posts/vaporwave-3d-scene-with-threejs/)

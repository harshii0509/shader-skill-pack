---
name: shader-platforms
description: Implement shader effects in the right rendering stack. Use when Codex needs React Three Fiber integration, render targets, offscreen scenes, scene transitions, FBO particles, TSL, WebGPU, compute-shader decisions, or Three.js scene assembly patterns distilled from Maxime Heckel's platform and pipeline articles.
---

# Shader Platforms

Use this skill when the main challenge is not the effect idea itself, but how to structure it in Three.js, React Three Fiber, render-target pipelines, or WebGPU-era tooling.

## Quick Start

1. Name the platform boundary first:
   - plain Three.js
   - React Three Fiber
   - post-processing or render-target stack
   - TSL or WebGPU
   - particle simulation with FBO or compute
2. Keep the technique and the platform decision separate.
3. Choose the smallest pipeline that can hold the effect.
4. Add advanced platform features only after the effect works in a simpler form.

## Core Workflow

### 1. Pick the runtime layer

- Use React Three Fiber when React orchestration and scene composition matter.
- Use render targets when the effect needs offscreen buffers, scene blending, or intermediate passes.
- Use TSL or WebGPU when the feature truly benefits from node-based authoring, compute, or newer GPU capabilities.

### 2. Protect pipeline clarity

Keep simulation, scene rendering, and post-processing stages separate so the pack stays debuggable.

### 3. Upgrade only for a reason

Do not move to compute or WebGPU just because it is newer. Move when scale, simulation, or data flow clearly benefit.

## Pitfalls

- Do not force WebGPU for effects that are already comfortable in WebGL.
- Do not bury transition logic inside a single oversized shader when render targets make the pipeline clearer.
- Do not confuse particle rendering with particle simulation; they often need different stages.

## When To Read References

- Read [references/platform-patterns.md](references/platform-patterns.md) for React Three Fiber, render targets, offscreen scenes, FBO particles, TSL, WebGPU, compute, and scene-transition patterns.

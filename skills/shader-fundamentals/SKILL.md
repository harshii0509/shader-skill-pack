---
name: shader-fundamentals
description: Build or teach core GLSL and WebGL shader techniques. Use when Codex needs to explain or implement signed distance fields, raymarching, fragment-space composition, uniforms and varyings, shader noise, full-screen effects, or introductory React Three Fiber shader work from Maxime Heckel's fundamentals-focused articles.
---

# Shader Fundamentals

Use this skill for first-principles shader work and for effects whose hardest part is building the core image-generation logic.

## Quick Start

1. Identify the working space first: screen UV, mesh UV, world space, or raymarched space.
2. Decide whether this is a full-screen fragment shader, a material shader, or a particle shader.
3. Start with the simplest scene primitive or SDF combination that proves the effect.
4. Expose only the uniforms needed to tune scale, time, camera, and interaction.
5. Validate the look before adding post-processing or platform complexity.

## Core Workflow

### 1. Choose the scene model

- Full-screen fragment for 2D procedural work or quick raymarched scenes.
- Material shader when the effect belongs on geometry.
- Particle shader when attributes, FBO state, or point behavior drive the look.

### 2. Lock the coordinate system

Most shader confusion comes from mixed spaces. Keep the effect clearly in one dominant space before blending spaces.

### 3. Grow from primitives

Start from circles, planes, spheres, boxes, or noise fields. For raymarching, prove the distance field and hit logic before layering detail.

### 4. Add interaction last

Mouse, scroll, and time uniforms are easiest to reason about after the static image works.

## Pitfalls

- Do not mix world space and screen UV logic casually.
- Do not add expensive loops before the base composition reads clearly.
- Do not route a refraction or atmosphere problem here if the hard part is light transport.

## When To Read References

- Read [references/foundations.md](references/foundations.md) for SDF, raymarching, particles, uniforms, render-loop setup, and scene-growth patterns.

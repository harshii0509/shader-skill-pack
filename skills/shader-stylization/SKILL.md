---
name: shader-stylization
description: Implement stylized shader looks and post-processing. Use when Codex needs halftone, CMYK, moire-aware channel screens, dithering, pixelization, CRT shading, comic or Moebius-style rendering, painterly Kuwahara filters, or other graphic post-processing techniques based on Maxime Heckel's stylized shader articles.
---

# Shader Stylization

Use this skill when the user cares most about the graphic language of the image rather than physically plausible rendering.

## Quick Start

1. Decide whether the look belongs in a post-processing pass or a surface shader.
2. Pick one dominant stylization family first:
   - halftone and cmyk
   - dithering and quantization
   - comic line and shadow treatment
   - painterly filters
3. Preserve a small tuning surface for pattern scale, angle, softness, palette, and blend strength.
4. Test the look in motion. Stylized passes often shimmer or overpower detail.

## Core Workflow

### 1. Simplify the source image

Stylized work gets stronger when the source is quantized, posterized, or otherwise reduced before the final patterning step.

### 2. Pick the pattern generator

- Halftone for print texture and graphic tone.
- Dithering for retro density and quantized gradients.
- Outline and shadow passes for comic or Moebius direction.
- Kuwahara-family filters for painterly abstraction.

### 3. Composite intentionally

Decide whether the effect replaces the source, tints it, or layers over it. Many bad stylized shaders are just strong filters with no compositing logic.

## Pitfalls

- Do not jump to CMYK when monochrome halftone already satisfies the look.
- Do not ignore moire and shimmer in animated patterns.
- Do not apply painterly filters before confirming the edge behavior still reads.

## When To Read References

- Read [references/stylized-recipes.md](references/stylized-recipes.md) for halftone, cmyk, moire, dithering, kuwahara, moebius, and post-processing recipes.

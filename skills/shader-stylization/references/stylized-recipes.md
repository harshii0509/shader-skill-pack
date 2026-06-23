# Stylized Recipes

Distilled from:

- `content/shades-of-halftone.mdx`
- `content/the-art-of-dithering-and-retro-shading-web.mdx`
- `content/post-processing-as-a-creative-medium.mdx`
- `content/moebius-style-post-processing.mdx`
- `content/on-crafting-painterly-shaders.mdx`

## Best Use Cases

- halftone
- cmyk
- moire control
- dithering
- color quantization
- pixelization
- crt
- moebius-style line and shadow treatment
- painterly post-processing
- kuwahara filters

## Pattern Selection

### Halftone and CMYK

- Use halftone when you need dot structure and print texture.
- Rotate cmyk channel screens separately to reduce moire.
- Keep dot size, angle, and softness exposed.

### Dithering and Retro Shading

- Use dithering when gradients need to break into deliberate pattern.
- Pair quantization with palette reduction instead of treating dithering as a standalone fix.
- Add pixelization or crt treatment only if the style calls for a display artifact, not just low fidelity.

### Moebius and Graphic Post FX

- Favor post-processing when the goal is stylized outlines, grouped shadows, and graphic lighting patterns across the whole scene.
- Keep outline logic and shadow logic separable so the style can breathe.

### Painterly and Kuwahara

- Use kuwahara-family filters for brush-like abstraction and local smoothing that preserves strong edges.
- Keep filter radius conservative at first. Painterly passes can destroy form quickly.

### Bloom and Glow

- Use a luminance threshold pass to isolate bright or emissive areas before blurring. Sample the scene colour, keep only pixels above a brightness threshold, and pass those to the glow stage.
- Apply a gaussian or multi-pass blur at increasing kernel radius for the glow spread. Separate horizontal and vertical passes for efficiency.
- Additively blend the blurred glow back over the base render for the bloom effect. Additive blending accumulates light energy naturally.
- Control bloom intensity with a strength multiplier on the additive blend weight and a softness curve on the threshold edge.
- Bloom fits naturally into a post-processing composition pipeline alongside tone mapping and colour grading.
- For emissive objects, store emissive intensity in a separate render target and use it as the direct bloom source to avoid over-blooming non-emissive bright surfaces.

## Tradeoffs

- Halftone is legible and art-directable, but it can shimmer if the grid is unstable.
- Dithering is great for retro texture, but it can look noisy if the palette is not constrained.
- Painterly filters feel rich, but they are usually heavier and easier to overdo than graphic post-processing.

## Source Signals To Reuse

- `halftone`
- `cmyk`
- `moire`
- `rotated`
- `dithering`
- `kuwahara`
- `painterly`
- `post-processing`
- `bloom`
- `glow`
- `luminance`
- `additive`

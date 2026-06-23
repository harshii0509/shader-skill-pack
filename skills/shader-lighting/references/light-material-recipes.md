# Light and Material Recipes

Distilled from:

- `content/refraction-dispersion-and-other-shader-light-effects.mdx`
- `content/caustics-in-webgl.mdx`

## Best Use Cases

- refraction
- chromatic dispersion
- fresnel shaping
- shininess tuning
- caustics
- projected light patterns
- normals-based distortion

## Implementation Playbook

### Refraction

- Start from a stable refracted sample direction.
- Use surface response and viewing angle to decide how strong the bend should feel.
- Add Fresnel or edge weighting only after the base read is correct.

### Dispersion

- Split channels after the refraction baseline is working.
- Keep the color space explicit so the separation does not become muddy too early.
- Increase shininess and volume carefully. The most common failure is rainbow noise instead of believable glass.

### Caustics

- Treat caustics as light shaped by surface normals, not as a generic animated decal.
- Extract or approximate the normals that drive the effect.
- Tune the projection and scale so the light looks attached to the water or refractive surface.

## Tradeoffs

- Refraction sells the material quickly, but it can break down if the sampled scene lacks enough detail.
- Dispersion adds richness, but too much channel spread destroys form.
- Dynamic caustics feel alive, but the projection path must stay coherent or the effect looks pasted on.

## Source Signals To Reuse

- `refraction`
- `dispersion`
- `fresnel`
- `color space`
- `caustics`
- `normals`
- `projection`
- `react three fiber`

# Atmosphere and Volume

Distilled from:

- `content/real-time-cloudscapes-with-volumetric-raymarching.mdx`
- `content/shaping-light-volumetric-lighting-with-post-processing-and-raymarching.mdx`
- `content/on-rendering-the-sky-sunsets-and-planets.mdx`

## Best Use Cases

- cloud raymarching
- volumetric light
- light shafts
- scattering
- sky gradients
- sunset rendering
- planetary atmosphere
- lut-based atmosphere

## Implementation Playbook

### Clouds

- Start from a readable density field and macro silhouette.
- Add noise derivatives and richer shading only after the cloud mass reads.
- Bring in self-shadowing or directional shadow carefully. It adds realism fast, but also cost.

### Volumetric Lighting

- Treat the effect as light traveling through media, not just bright fog.
- Use shadow mapping or a similar occlusion proxy when the volume needs structure.
- Add scattering improvements after the base shaft or beam pattern works.

### Sky and Atmosphere

- Build the sky gradient first.
- Layer scattering and atmosphere response around the sun direction and horizon.
- Reach for LUT strategies when the scene needs broader atmospheric range without a massive runtime cost.

## Tradeoffs

- Raymarched clouds are expressive, but the sample budget gets expensive quickly.
- Post-processed volumetric shafts are cheaper, but less physically rich than full volume integration.
- LUT-based atmosphere can scale better, but it adds precomputation and data plumbing.

## Source Signals To Reuse

- `cloud`
- `volumetric`
- `shadow`
- `scattering`
- `sky`
- `atmosphere`
- `planetary`
- `lut`

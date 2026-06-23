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
- Rayleigh scattering models small-particle interaction — the blue sky results from Rayleigh dominating at short wavelengths.
- Mie scattering models larger-particle interaction, producing the diffuse glare and forward-scattering that makes sunsets orange and milky.
- Beer-Lambert attenuation governs how light intensity drops through an absorbing or scattering medium; use it as the base extinction model before adding wavelength-dependent colour shifts.
- Reach for LUT strategies when the scene needs broader atmospheric range without a massive runtime cost.

### Simple Fog

- Use depth-based linear or exponential fog when the goal is to fade geometry at distance into the background colour.
- Mix the surface colour toward the fog colour using a depth factor derived from the camera distance or the fragment's view-space Z.
- Exponential fog (`exp(-depth * density)`) gives a smoother falloff than linear fog for most outdoor scenes.
- In a WebGL fragment shader, read depth from `gl_FragCoord.z` divided by `gl_FragCoord.w`, or sample a depth texture from a render target.
- In R3F, integrate fog as a post-processing blend or use Three.js scene fog to let the renderer handle depth fading automatically.

## Tradeoffs

- Raymarched clouds are expressive, but the sample budget gets expensive quickly.
- Post-processed volumetric shafts are cheaper, but less physically rich than full volume integration.
- LUT-based atmosphere can scale better, but it adds precomputation and data plumbing.
- Simple fog is the cheapest volumetric option; use it when depth fading alone is sufficient and full scattering is overkill.

## Source Signals To Reuse

- `cloud`
- `volumetric`
- `shadow`
- `scattering`
- `sky`
- `atmosphere`
- `planetary`
- `lut`
- `fog`
- `depth`
- `beer-lambert`
- `mie`
- `rayleigh`
- `sunset`

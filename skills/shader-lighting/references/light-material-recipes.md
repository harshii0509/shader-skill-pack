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
- In React Three Fiber, update the normal map and projection uniforms each frame with useFrame. Pass the light direction and surface normal texture as uniforms into the caustics shader.
- Keep the caustics projection coherent with the geometry it falls on — dynamic pool caustics in React Three Fiber need the projected light to track the water surface normals in real time.

### Water and Translucent Surfaces

- Water surfaces combine two lighting behaviours: normal-driven surface ripples (from a normal map or animated noise) and glass-like refraction to the geometry below.
- Animate the water normal map or derive normals from procedural ripple functions driven by time.
- Refract the scene geometry under the water surface by offsetting the sample UV with the normal-map value before reading the background render target.
- Layer Fresnel shaping on top so shallow angles see more reflection and steep angles see more transmission into the water.
- Shallow water caustics can be layered under the water surface as a projected light pattern driven by the same normal map — the ripple normals and the caustic pattern should stay in sync.
- Glass surfaces follow the same refraction path, with dispersion added by splitting red, green, and blue channels at slightly different refraction angles.

## Tradeoffs

- Refraction sells the material quickly, but it can break down if the sampled scene lacks enough detail.
- Dispersion adds richness, but too much channel spread destroys form.
- Dynamic caustics feel alive, but the projection path must stay coherent or the effect looks pasted on.
- Water surface shaders that combine normals, refraction, and caustics in one pass are expressive but hard to tune — split concerns across separate passes when the interaction gets complex.

## Source Signals To Reuse

- `refraction`
- `dispersion`
- `fresnel`
- `color space`
- `caustics`
- `normals`
- `projection`
- `react three fiber`
- `water`
- `glass`
- `ripple`
- `transmission`

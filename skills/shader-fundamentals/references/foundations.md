# Foundations

Distilled from:

- `content/painting-with-math-a-gentle-study-of-raymarching.mdx`
- `content/the-study-of-shaders-with-react-three-fiber.mdx`
- `content/the-magical-world-of-particles-with-react-three-fiber-and-shaders.mdx`

## Best Use Cases

- first shader from scratch
- sdf scene building
- raymarch loops
- uniforms and varyings
- interactive fragment work
- particles driven by custom attributes

## Implementation Playbook

### Space

- Pick one dominant space first: screen, uv, world, or raymarched camera space.
- Normalize and document that choice in the shader uniforms.

### SDF and Raymarch

- Start from one SDF primitive.
- Add union, subtraction, repetition, or deformation only after the hit logic is stable.
- Keep the raymarch loop readable: origin, direction, distance accumulation, surface hit threshold, normal estimation.

### Shader Composition

- Introduce time, mouse, and scroll only after the static shape reads.
- Use uniforms for the tuning surface and varyings only for data that truly needs interpolation.

### Particles

- Use attributes when each point needs distinct state.
- Consider an FBO or simulation texture only when particle history matters between frames.

### Noise and Domain Warping

- Use value noise or gradient noise (Perlin-style) as the base layer for organic variation.
- Layer multiple noise octaves with decreasing amplitude and increasing frequency to build fBm (fractional Brownian motion). Each octave adds finer detail without changing the overall shape.
- Apply domain warping by feeding one fBm result into the input coordinates of another fBm call. This produces organic, fluid, self-similar distortion that looks nothing like a simple texture.
- Worley noise (cellular noise) generates natural cell boundaries and crack patterns, useful for surface detail or voronoi-style structure.
- Control character with the octave count, lacunarity (frequency multiplier per octave), and gain (amplitude multiplier per octave) rather than random texture lookups.
- Keep the noise function deterministic and pure — seed randomness through a hash of UV or position, not time, so results are stable under camera movement.

## Tradeoffs

- Raymarching gives fast visual iteration, but it can get expensive quickly.
- Material shaders stick well to geometry, but they are less freeform than full-screen composition.
- Particle systems are expressive, but state management gets harder once simulation enters the loop.

## Source Signals To Reuse

- `sdf`
- `raymarch`
- `uniforms`
- `varyings`
- `attributes`
- `particles`
- `space`
- `fbm`
- `domain warping`
- `worley`
- `gradient noise`
- `noise`

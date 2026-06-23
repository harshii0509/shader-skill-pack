# Platform Patterns

Distilled from:

- `content/field-guide-to-tsl-and-webgpu.mdx`
- `content/beautiful-and-mind-bending-effects-with-webgl-render-targets.mdx`
- `content/the-magical-world-of-particles-with-react-three-fiber-and-shaders.mdx`
- `content/vaporwave-3d-scene-with-threejs.mdx`

## Best Use Cases

- react three fiber
- render targets
- offscreen scenes
- transition pipelines
- particles
- fbo state
- tsl
- webgpu
- compute shaders

## Implementation Playbook

### React Three Fiber

- Use React Three Fiber when scene composition, component boundaries, and declarative control matter more than raw imperative setup.
- Keep heavy shader logic inside shader modules even if orchestration lives in React.

### Render Targets and Offscreen Scenes

- Reach for render targets when you need intermediate images, scene feedback, transitions, or multi-pass composition.
- Keep each pass legible. Offscreen scenes are powerful, but the pipeline gets hard to debug if everything is implicit.

### Particles and Simulation

- Use custom attributes for simple per-particle variation.
- Move to FBO state or simulation textures when particle history matters across frames.
- Consider compute only when the simulation pressure outgrows the older pipeline.

### TSL and WebGPU

- Use TSL when node-based shader construction and WebGPU-era features help the team move faster.
- Reach for compute shaders when the problem is truly data-parallel simulation, not just ordinary shading.

## Tradeoffs

- React Three Fiber speeds iteration, but hidden abstraction can obscure low-level pipeline issues.
- Render targets unlock rich effects, but every extra pass adds complexity.
- WebGPU and compute expand the ceiling, but they raise portability and implementation cost.

## Source Signals To Reuse

- `react three fiber`
- `render targets`
- `offscreen`
- `transition`
- `particles`
- `fbo`
- `tsl`
- `webgpu`
- `compute`

# The Culprits: Why is Rastering Slow?

Rasterization is the process of turning vector draw commands (like "draw a rectangle here") into a
bitmap of pixels in memory. High raster times usually point to a few specific issues:

In Flutter, the UI thread creates the layer tree (what you saw taking less time)
and the Raster thread (formerly the GPU thread) takes that layer tree and talks to the GPU via
Impeller (or Skia)
to turn it into pixels. If your raster thread is spiking past 17ms, you're dropping frames.
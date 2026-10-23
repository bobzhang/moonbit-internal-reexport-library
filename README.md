# Internal type re-export provider

This repository is the library half of a two-repository MoonBit reproducer.
Keep the consumer repository in a sibling directory named `consumer`.
The consumer's `moon.work` connects the modules without publishing either one.

`internal/x` owns a **publicly constructible** `TypeA` enum, its public
`method1`, and a publicly constructible `ResolveError` suberror.
`y` publicly re-exports these types and supplies `make` and `fail_resolution`.

`x` and `public_y` contain the same implementation and facade, but the owner is
not internal. They are the passing control.

`y/y_test.mbt` is a black-box test inside this library module. Its constructor,
method, and error-catching checks all pass. That does not establish that an
external module can use the re-exports; see the consumer repository.

Run the library's black-box checks from the sibling consumer:

```sh
moon test ../library/y --target all --deny-warn
```

Toolchain tested: moon 0.1.20261021 (a4f8933), moonc
v0.10.17+093cb8f9c (2026-10-21).

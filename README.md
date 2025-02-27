# rough-lua

[![license](https://img.shields.io/github/license/Omikhleia/rough-lua?label=License)](LICENSE)
[![Luacheck](https://img.shields.io/github/actions/workflow/status/Omikhleia/rough-lua/luacheck.yml?branch=main&label=Luacheck&logo=Lua)](https://github.com/Omikhleia/rough-lua/actions?workflow=Luacheck)
[![Luarocks](https://img.shields.io/luarocks/v/Omikhleia/rough-lua?label=Luarocks&logo=Lua)](https://luarocks.org/modules/Omikhleia/rough-lua)

This a Lua port of the [Rough.js](https://roughjs.com/) library.

It is a small graphics library that lets you draw lines, polygons and curves in a sketchy, hand-drawn-like, style.

## Features

Most of the features of the original library are available in this port.

However, some parts (notably in the `rough.untested` folder) have not been thoroughly tested.

Other than that, this module is used in production since 2023, as a (originally internal) dependency of the [**resilient.sile**](https://github.com/Omikhleia/resilient.sile) collection for the [SILE](https://sile-typesetter.org/) typesetting system. 
More precisely, it is a dependency for some of the other modules on which _re·sil·ient_ depends. By nature, in that context, it is used to generate PDF graphics (rather than SVG or Web-related graphics, the usual targets of the original library).

In folder `prng-prigarin`, this module also includes a pseudo-random number generator (PRNG) used by default in the Lua implementation of the library (rather then relying on Lua's `math.random` function).
The objective is to provide a reproducible output, while still being able to generate a seemingly uniform distribution of "random" numbers.

Typically, in SILE's use case, this is used to generate rough shapes (_e.g._ framed boxes), with a consistent appearance across runs, when the final PDF is generated.

## Installation

Installation relies on the **luarocks** package manager.

To install the latest version, you may use the provided “rockspec”:

```
luarocks install rough
```

The module depends on the `penlight` library, which will be installed automatically by luarocks, if not already present.

## Usage

Examples are provided in the [examples](./examples) folder.

## Historical notes

A first partial port of Rough.js to Lua was made in March 2022, as part of the (now unmaintained) [**omikhleia-sile-packages**](https://github.com/Omikhleia/omikhleia-sile-packages/tree/main/packages/graphics) collection for SILE 0.12.x.

In August 2022, it was updated and integrated into the [**ptable.sile**](https://github.com/Omikhleia/ptable.sile) module, for use with more recent versions of SILE.

In March 2024, the port was entirely re-organized and completed (ptable release v3.0.0), updated to match the latest version of the original library at the time.

In February 2025, the code was extracted and made into a standalone module.

## License

The code and samples in this repository are released under the MIT License, (c) 2022-2023, 2025 Omikhleia, Didier Willis.

The original JavaScript-based [Rough.js](https://github.com/rough-stuff/rough) library is released under the MIT License, (c) 2019 Preet Shihn.

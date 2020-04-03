# Alien::wasmtime [![Build Status](https://secure.travis-ci.org/perlwasm/Alien-wasmtime.png)](http://travis-ci.org/perlwasm/Alien-wasmtime) ![windows](https://github.com/perlwasm/Alien-wasmtime/workflows/windows/badge.svg) ![macos](https://github.com/perlwasm/Alien-wasmtime/workflows/macos/badge.svg)

Find or download wasmtime for use by other Perl modules

# SYNOPSIS

```perl
use Alien::wasmtime;
use FFI::Platypus 1.00;

my $ffi = FFI::Platypus->new(
  api => 1,
  lib => [Alien::wasmtime->dynamic_libs],
);
```

# DESCRIPTION

This [Alien](https://metacpan.org/pod/Alien) provides `wasmtime` a runtime for Wasm (Web Assembly).
It's intended to be used by FFI (not XS) to build Wasm bindings for
Perl.

# SEE ALSO

- [Wasm::Wasmtime](https://metacpan.org/pod/Wasm::Wasmtime)
- [Alien](https://metacpan.org/pod/Alien)
- [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2020 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

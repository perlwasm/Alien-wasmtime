package Alien::wasmtime;

use strict;
use warnings;
use 5.008001;
use base qw( Alien::Base );

# ABSTRACT: Find or download wasmtime for use by other Perl modules
# VERSION

=head1 SYNOPSIS

 use Alien::wasmtime;
 use FFI::Platypus 1.00;
 
 my $ffi = FFI::Platypus->new(
   api => 1,
   lib => [Alien::wasmtime->dynamic_libs],
 );

=head1 DESCRIPTION

B<NOTE>: If you want to call WebAssembly from Perl you want to use
L<Wasm> or L<Wasm::Wasmtime> instead.

This L<Alien> provides C<wasmtime> a library runtime for Wasm
(WebAssembly).  It's intended to be used by FFI (not XS) to build
Wasm bindings for Perl.

=head1 METHODS

=head2 dynamic_libs

 my @libs = Alien::wasmtime->dynamic_libs;

Returns the list of libraries needed to use C<wasmtime> via FFI.

=head1 ENVIRONMENT

=over 4

=item C<ALIEN_WASMTIME_VERSION>

Override the version of C<wasmtime> downloaded.  To get the latest development
release you can install with:

 $ env ALIEN_WASMTIME_VERSION=dev cpanm Alien::wasmtime

=back

=head1 CAVEATS

Wasm and C<wasmtime> is a moving target at the moment, so expect breakage
until it becomes stable.

Normally L<Alien>s should try to use the system library before downloading
from the internet.  Since C<wasmtime> isn't provided by many package managers
yet, we skip this step for now.  In the future we will support probing of
the system C<wasmtime>.

This L<Alien> is geared for use with FFI only.

=head1 SEE ALSO

=over 4

=item L<Wasm>

High level interface to WebAssembly which uses wasmtime under the covers.

=item L<Wasm::Wasmtime>

Lower-level direct interface to Wasmtime itself from Perl.

=item L<Alien>

Documentation for the Perl / Alien concept.

=item L<FFI::Platypus>

Foreign function interface to dynamic libraries in perl via C<libffi>.

=back

=cut

1;



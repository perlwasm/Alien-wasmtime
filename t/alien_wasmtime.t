use Test2::V0 -no_srand => 1;
use FFI::Platypus 1.00;
use Test::Alien;
use Test::Alien::Diag;
use Alien::wasmtime;

alien_ok 'Alien::wasmtime';
alien_diag 'Alien::wasmtime';

done_testing;



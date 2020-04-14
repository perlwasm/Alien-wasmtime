use Test2::V0 -no_srand => 1;
use FFI::Platypus 1.00;
use Test::Alien 1.90;
use Test::Alien::Diag;
use Alien::wasmtime;

alien_ok 'Alien::wasmtime';
alien_diag 'Alien::wasmtime';

my @dll = Alien::wasmtime->dynamic_libs;
ok scalar(@dll), 'at least one dynamic library found';

ffi_ok
  {
    symbols => [ qw( wasm_engine_new wasm_engine_delete ) ],
    api => 1,
  },
  with_subtest {
    my($ffi) = @_;
    my $engine = $ffi->function( wasm_engine_new => [] => 'opaque' )->call;
    ok $engine;
    note "engine = $engine";

    my $store = $ffi->function( wasm_store_new => ['opaque'] => 'opaque' )->call($engine);
    ok $store;
    note "store = $store";

    my $memorytype = $ffi->function( wasm_memorytype_new => ['uint32[2]'] => 'opaque' )->call([1,2]);
    ok $memorytype;
    note "memorytype = $memorytype";

    my $memory = $ffi->function( wasm_memory_new => ['opaque','opaque'] => 'opaque' )->call($store, $memorytype);
    ok $memory;
    note "memory = $memory";

    $ffi->function( wasm_memory_delete => ['opaque'] => 'void' )->call($memory);
    $ffi->function( wasm_memorytype_delete => ['opaque'] => 'void' )->call($memorytype);
    $ffi->function( wasm_store_delete => ['opaque'] => 'void' )->call($store);
    $ffi->function( wasm_engine_delete => ['opaque'] => 'void' )->call($engine);
    ok 1;
  }
;

done_testing;



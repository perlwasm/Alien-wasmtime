package mymm;

use strict;
use warnings;
use Config;

unless($^O =~ /^(MSWin32|linux|darwin)$/)
{
  print "Operating system not supported.\n";
  print "If we are missing a binary tarball that could work for your platform, please comment here:\n"
  print "https://github.com/perlwasm/Alien-wasmtime/issues/2\n";
  exit;
}

1;

#!/usr/bin/env perl -w
use strict;
use utf8;
use Test::More tests => 2;
use Time::Elapsed qw(elapsed); 

my $en1   = elapsed();
my $en2   = elapsed(undef);

ok( ! defined($en1), qq{Parameter is undef} );
ok( ! defined($en2), qq{Parameter is undef} );

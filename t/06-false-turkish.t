#!/usr/bin/env perl -w
use strict;
use utf8;
use Test::More tests => 3;
use Time::Elapsed qw(elapsed);

eval q{ binmode Test::More->builder->output, ':utf8'; } if $] >= 5.008;

my $t1   = elapsed(  0, 'TR' );
my $t2   = elapsed( '', 'TR' );
my $want = "sıfır saniye";

ok( $t1 eq $want, qq{"$t1" eq "$want"} );
ok( $t2 eq $want, qq{"$t2" eq "$want"} );
ok( $t1 eq $t2  , qq{"$t1" eq "$t2"}   );

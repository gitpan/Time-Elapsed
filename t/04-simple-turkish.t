#!/usr/bin/env perl -w
use strict;
use utf8;
use Test::More tests => 1;
use Time::Elapsed qw(elapsed); 

eval q{ binmode Test::More->builder->output, ':utf8'; } if $] >= 5.008;

my $tur  = elapsed(1868405, 'TR');
my $want = "21 gün, 15 saat ve 5 saniye";

ok( $tur eq $want, qq{"$tur" eq "$want"} );

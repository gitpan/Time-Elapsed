#!/usr/bin/env perl -w
use strict;
use utf8;
use Test::More tests => 1;
use Time::Elapsed qw(elapsed); 

my $tur  = elapsed(1868405, 'TR');
my $want = "21 gün, 15 saat ve 4 saniye";

ok( $tur eq $want, qq{"$tur" eq "$want"} );

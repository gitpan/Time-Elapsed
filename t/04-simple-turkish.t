#!/usr/bin/env perl -w
use strict;
use utf8;
use Test::More tests => 1;
use Time::Elapsed qw(elapsed); 

my $tur = elapsed(1868401, 'TR');

ok( $tur eq "21 gün, 15 saat ve 1 saniye", qq{"$tur" eq "21 gün, 15 saat ve 1 saniye"} );

#!/usr/bin/env perl -w
use strict;
use utf8;
use Test::More tests => 3;
use Time::Elapsed qw(elapsed); 

my $en1  = elapsed(1868405      );
my $en2  = elapsed(1868405, 'EN');
my $want = "21 days, 15 hours and 5 seconds";

ok( $en1 eq $want, qq{"$en1" eq "$want"} );
ok( $en2 eq $want, qq{"$en2" eq "$want"} );
ok( $en1 eq $en2 , qq{"$en1" eq "$en2"}  );
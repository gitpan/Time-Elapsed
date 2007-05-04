#!/usr/bin/env perl -w
use strict;
use utf8;
use Test::More tests => 3;
use Time::Elapsed qw(elapsed); 

my $en1  = elapsed(0);
my $en2  = elapsed('');
my $want = "zero seconds";

ok( $en1 eq $want, qq{"$en1" eq "$want"} );
ok( $en2 eq $want, qq{"$en2" eq "$want"} );
ok( $en1 eq $en2 , qq{"$en1" eq "$en2"}  );

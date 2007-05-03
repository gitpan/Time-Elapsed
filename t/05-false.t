#!/usr/bin/env perl -w
use strict;
use utf8;
use Test::More tests => 3;
use Time::Elapsed qw(elapsed); 

my $en1   = elapsed(0);
my $want1 = "0 second";

my $en2   = elapsed('');
my $want2 = "0 second";

ok( $en1 eq $want1, qq{"$en1" eq "$want1"} );
ok( $en2 eq $want2, qq{"$en2" eq "$want2"} );
ok( $en1 eq $en2  , qq{"$en1" eq "$en2"}   );

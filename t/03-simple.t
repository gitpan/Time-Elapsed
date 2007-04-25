#!/usr/bin/env perl -w
use strict;
use utf8;
use Test::More tests => 3;
use Time::Elapsed qw(elapsed); 

my $en1 = elapsed(1868401      );
my $en2 = elapsed(1868401, 'EN');

ok( $en1 eq "21 days, 15 hours and 1 second", qq{"$en1" eq "21 days, 15 hours and 1 second"} );
ok( $en2 eq "21 days, 15 hours and 1 second", qq{"$en2" eq "21 days, 15 hours and 1 second"} );
ok( $en1 eq $en2                            , qq{"$en1" eq "$en2"} );
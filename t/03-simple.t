#!/usr/bin/env perl -w
use strict;
use Test;
BEGIN { plan tests => 1 }

use Time::Elapsed qw(elapsed); 

ok( elapsed(1868401) eq '21 days, 15 hours and 1 second' );

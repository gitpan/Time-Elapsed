#!/usr/bin/env perl -w
use strict;
use utf8;
use Test;
BEGIN { plan tests => 1 }

use Time::Elapsed qw(elapsed); 

ok( elapsed(1868401, 'TR') eq '21 gün, 15 saat ve 1 saniye' );

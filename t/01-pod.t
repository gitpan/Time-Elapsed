#!/usr/bin/env perl -w
use strict;
BEGIN { do 't/skip.test' or die "Can't include skip.test!" }

eval "use Test::Pod 1.00";

if ( $@ ) {
   plan skip_all => "Test::Pod 1.00 required for testing POD";
}
else {
   if ( $] < 5.008 ) {
      # Any older perl does not have Encode.pm. Thus, Pod::Simple
      # can not handle utf8 encoding and it will die, the tests
      # will fail. This skip part, skips an inevitable failure.
      plan skip_all => "'=encoding utf8' directives in Pods don't work "
                      ."with legacy perl.";
   }
   else {
      all_pod_files_ok();
   }
}

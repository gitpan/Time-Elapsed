package Time::Elapsed;
use strict;
use utf8;
use vars qw( $VERSION @ISA @EXPORT_OK );
# time constants
use constant SECOND     =>   1;
use constant MINUTE     =>  60 * SECOND;
use constant HOUR       =>  60 * MINUTE;
use constant DAY        =>  24 * HOUR;
use constant MONTH      =>  30 * DAY;
use constant YEAR       => 365 * DAY;
# elapsed data fields
use constant INDEX      => 0;
use constant MULTIPLIER => 1;
use Exporter ();

$VERSION   = '0.17';
@ISA       = qw( Exporter );
@EXPORT_OK = qw( elapsed  );

# elapsed time formatter keys
my $ELAPSED = {
   # name      index  multiplier
   second => [  0,      60     ],
   minute => [  1,      60     ],
   hour   => [  2,      60     ],
   day    => [  3,      24     ],
   month  => [  4,      30     ],
   year   => [  5,      12     ],
};

my @NAMES = sort  { $ELAPSED->{ $a }[INDEX] <=> $ELAPSED->{ $b }[INDEX] }
            keys %{ $ELAPSED };

sub elapsed {
   my $sec      = shift;
   return if not defined $sec;
   my $lang     = shift || 'EN';
   my $template = shift || '';
   my $data     = '';
      $sec      = 0 if not $sec;
      $sec     += 0; # force number

   # get language keys
   my $class    = _get_lang_class( $lang );
   my %singular = $class->singular;
   my %plural   = $class->plural;
   my %other    = $class->other;

   return $other{zero} if not $sec;

   my $index;
      if ( $sec >= YEAR   ) { $data = $sec / YEAR  ; $index = 'year'   }
   elsif ( $sec <= MONTH  ) { $data = $sec / MONTH ; $index = 'month'  }
   elsif ( $sec <= DAY    ) { $data = $sec / DAY   ; $index = 'day'    }
   elsif ( $sec <= HOUR   ) { $data = $sec / HOUR  ; $index = 'hour'   }
   elsif ( $sec <= MINUTE ) { $data = $sec / MINUTE; $index = 'minute' }
   else {
      my $ismon = $sec < YEAR && $sec > MONTH;
        if ( $ismon       ) { $data = $sec / MONTH;  $index = 'month'  }
      else                  { $data = $sec;          $index = 'second' }
   }

   my @parsed   = _fixer( _parser( $index, $data ) );

   my @str;
   POPULATE: foreach my $e ( @parsed ) {
      next if not $e->[MULTIPLIER]; # disable zero values
      push @str,  $e->[MULTIPLIER]
                  .' '.
                  (
                     $e->[MULTIPLIER] > 1 ? $plural{   $e->[INDEX] }
                                          : $singular{ $e->[INDEX] }
                  )
   }

   if ( @str > 1 ) {
      my $is_ok = $template && ref($template) && ref($template) eq 'HASH';
      if ( $is_ok ) {
         my $comma = $template->{comma} || ', ';
         my $end   = $template->{end}   || ' <%AND%> <%LAST%>';
         my $last  = pop @str;
         my $and   = $other{and};
            $end   =~ s{<%AND%>}{$and}xmsg;
            $end   =~ s{<%LAST%>}{$last}xmsg;
         return join($comma, @str) . $end;
      }
      else {
         my $last  = pop @str;
         return join(', ', @str) . " $other{and} $last";
      }
   }
   return $str[0]; # only a single value, no need for template/etc.
}

sub _fixer {
   # There can be values like "60 seconds". _fixer() corrects this kind of error
   my @raw = @_;
   my(@fixed,$default,$add);

   foreach my $e ( reverse @raw ) {
      $default = $ELAPSED->{ $e->[INDEX] }[MULTIPLIER];
      if ( $add ) {
         $e->[MULTIPLIER] += $add; # we need a fix
         $add              = 0;    # reset
      }
      if ( $e->[MULTIPLIER] >= $default) {
         $add = int $e->[MULTIPLIER] / $default;
         $e->[MULTIPLIER] -= $default * $add;
      }
      push @fixed, [ $e->[INDEX], $e->[MULTIPLIER] ];
   }

   return reverse @fixed;
}

sub _parser { # recursive formatter/parser
   my($id, $mul) = @_;
   my $xmid = $ELAPSED->{$id}[INDEX];
   my @parsed;
   push @parsed, [ $id,  $xmid ? int($mul) : sprintf('%.0f', $mul) ];
   if ( $xmid ) {
      push @parsed, _parser(
         $NAMES[ $xmid - 1 ],
        ($mul - int $mul) * $ELAPSED->{$id}[MULTIPLIER]
      );
   }
   return @parsed;
}

sub _get_lang_class {
   my $lang = shift;
   if ( $lang =~ m{[^a-z_A-Z_0-9]}xms || $lang =~ m{ \A [0-9] }xms) {
      die "Bad language identifier: $lang";
   }
   $lang = uc $lang;
   my $class = join '::', __PACKAGE__, 'Lang', $lang;
   my $file  = join('/', split /::/, $class ) . '.pm';
   if ( not exists $INC{ $file } ) {
      require $file;
   }
   return $class;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Time::Elapsed - Displays the elapsed time as a human readable string.

=head1 SYNOPSIS

   use Time::Elapsed qw( elapsed );
   $t = 1868401;
   print elapsed( $t );

prints:

   21 days, 15 hours and 1 second

If you set the language to turkish:

   print elapsed( $t, 'TR' );

prints:

   21 gün, 15 saat ve 1 saniye

=head1 DESCRIPTION

This module transforms the elapsed seconds into a human readable string.
It can be used for (for example) rendering C<uptime> values into
a human readable form. The resulting string will be an approximation.
See the L</CAVEATS> section for more information.

=head1 FUNCTIONS

=head2 elapsed SECONDS [, LANG, TEMPLATE]

=over 4

=item *

C<SECONDS> must be a number representing the elapsed seconds.
If it is false, C<0> (zero) will be used. If it is not defined, C<undef>
will be returned.

=item *

The optional argument C<LANG> represents the language to use when
converting the data to a string. The language section is really a
standalone module in the C<Time::Elapsed::Lang::> namespace, so it is
possible to extend the language support on your own. Currently
supported languages are:

   Parameter  Description
   ---------  -----------------
      EN      English (default)
      TR      Turkish

Language ids are case-insensitive. These are all same: C<en>, C<EN>, C<eN>.

=item *

The optional argument C<TEMPLATE> can alter the generated string' s format.
This option is currently not documented.

=back

=head1 CAVEATS

=over 4

=item *

The calculation of the elapsed time is only an approximation, since these
values are used internally:

   1 Day   =  24 Hour
   1 Month =  30 Day
   1 Year  = 365 Day

See
L<"How Datetime Math is Done" in DateTime|DateTime/How Datetime Math is Done>
for more information on this subject. Also see C<in_units()> method in
L<DateTime::Duration>.

=item *

This module' s source file is UTF-8 encoded (without a BOM) and it returns
UTF-8 values whenever possible.

=item *

Currently, the module won't work with any perl older than 5.6 because of
the UTF-8 encoding and the usage of L<utf8> pragma. However, the pragma
limitation can be by-passed with a C<%INC> trick under 5.005_04 (tested)
and can be used with english language (default behavior), but any other
language will probably need unicode support.

=back

=head1 SEE ALSO

L<PTools::Time::Elapsed>, L<DateTime>, L<DateTime::Format::Duration>

=head1 AUTHOR

Burak Gürsoy, E<lt>burakE<64>cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2007 Burak Gürsoy. All rights reserved.

=head1 LICENSE

This library is free software; you can redistribute it and/or modify 
it under the same terms as Perl itself, either Perl version 5.8.8 or, 
at your option, any later version of Perl 5 you may have available.

=cut

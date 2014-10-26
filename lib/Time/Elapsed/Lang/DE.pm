package Time::Elapsed::Lang::DE;
use strict;
use warnings;
use utf8;
use vars qw( $VERSION );

$VERSION = '0.31';

sub singular {
   return qw/
   second  Sekunde
   minute  Minute
   hour    Stunde
   day     Tag
   week    Woche
   month   Monat
   year    Jahr
   /
}

sub plural {
   return qw/
   second  Sekunden
   minute  Minuten
   hour    Stunden
   day     Tage
   week    Wochen
   month   Monate
   year    Jahre
   /
}

sub other {
   return qw/
   and     und
   ago     vor
   /,
   zero => q{Nullsekunden},
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Time::Elapsed::Lang::DE - German language file.

=head1 SYNOPSIS

Private module.

=head1 DESCRIPTION

This document describes version C<0.31> of C<Time::Elapsed::Lang::DE>
released on C<9 February 2011>.

Private module.

=head1 METHODS

=head2 singular

=head2 plural

=head2 other

=head1 SEE ALSO

L<Time::Elapsed>.

=head1 AUTHOR

Burak Gursoy <burak@cpan.org>.

=head1 COPYRIGHT

Copyright 2007 - 2011 Burak Gursoy. All rights reserved.

=head1 LICENSE

This library is free software; you can redistribute it and/or modify 
it under the same terms as Perl itself, either Perl version 5.12.1 or, 
at your option, any later version of Perl 5 you may have available.

=cut

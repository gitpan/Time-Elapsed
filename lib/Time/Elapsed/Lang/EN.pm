package Time::Elapsed::Lang::EN;
use strict;
use warnings;
use utf8;
use vars qw( $VERSION );

$VERSION = '0.31';

sub singular {
   return qw/
   second  second
   minute  minute
   hour    hour
   day     day
   week    week
   month   month
   year    year
   /
}

sub plural {
   return qw/
   second  seconds
   minute  minutes
   hour    hours
   day     days
   week    weeks
   month   months
   year    years
   /
}

sub other {
   return qw/
   and     and
   ago     ago
   /,
   zero => q{zero seconds},
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Time::Elapsed::Lang::EN - English language file.

=head1 SYNOPSIS

Private module.

=head1 DESCRIPTION

This document describes version C<0.31> of C<Time::Elapsed::Lang::EN>
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

package Time::Elapsed::Lang::TR;
use strict;
use vars qw( $VERSION        );
use subs qw( singular plural );
use utf8;

$VERSION = '0.27';

*plural = \&singular;

sub singular {
   qw/
   second  saniye
   minute  dakika
   hour    saat
   day     gün
   month   ay
   year    yıl
   /
}

sub other {
   qw/
   and     ve
   ago     önce
   /,
   zero => q{sıfır saniye},
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Time::Elapsed::Lang::TR - Turkish language file.

=head1 SYNOPSIS

Private module.

=head1 DESCRIPTION

This document describes version C<0.27> of C<Time::Elapsed::Lang::TR>
released on C<21 April 2009>.

Private module.

=head1 METHODS

=head2 singular

=head2 plural

=head2 other

=head1 SEE ALSO

L<Time::Elapsed>.

=head1 AUTHOR

Burak Gürsoy, E<lt>burakE<64>cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2007-2008 Burak Gürsoy. All rights reserved.

=head1 LICENSE

This library is free software; you can redistribute it and/or modify 
it under the same terms as Perl itself, either Perl version 5.8.8 or, 
at your option, any later version of Perl 5 you may have available.

=cut

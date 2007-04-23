package Time::Elapsed::Lang::TR;
use strict;
use utf8;
use vars qw($VERSION);

$VERSION = '0.10';

sub singular {
   second  => q{saniye},
   minute  => q{dakika},
   hour    => q{saat},
   day     => q{gün},
   month   => q{ay},
   year    => q{yıl},
}

sub plural { &singular }

sub other {
   and => q{ve},
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Time::Elapsed::Lang::EN - Turkish language file.

=head1 SYNOPSIS

Private module.

=head1 DESCRIPTION

Private module.

=head1 SEE ALSO

L<Time::Elapsed>.

=head1 AUTHOR

Burak Gürsoy, E<lt>burakE<64>cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2007 Burak Gürsoy. All rights reserved.

=head1 LICENSE

This library is free software; you can redistribute it and/or modify 
it under the same terms as Perl itself, either Perl version 5.8.8 or, 
at your option, any later version of Perl 5 you may have available.

=cut

package Catalyst::Plugin::FormValidator;

use strict;
use NEXT;
use Data::FormValidator;

our $VERSION = '0.01';

=head1 NAME

Catalyst::Plugin::FormValidator - FormValidator for Catalyst

=head1 SYNOPSIS

    use Catalyst 'FormValidator';

    $c->form( optional => ['rest'] );
    print $c->form->valid('rest');

=head1 DESCRIPTION

L<Data::FormValidator> plugin.

=head2 EXTENDED METHODS

=head3 prepare

=cut

sub prepare {
    my $c = shift;
    $c = $c->NEXT::prepare(@_);
    $c->{form} = Data::FormValidator->check( $c->request->parameters, {} );
    return $c;
}

=head2 METHODS

=head3 form

Merge values with FormValidator.

    $c->form( required => ['yada'] );

Returns a C<Data::FormValidator::Results> object.

    $c->form->valid('rest');

=cut

sub form {
    my $c = shift;
    if ( $_[0] ) {
        my $form = $_[1] ? {@_} : $_[0];
        $c->{form} =
          Data::FormValidator->check( $c->request->parameters, $form );
    }
    return $c->{form};
}

=head1 SEE ALSO

L<Catalyst>, L<Data::FormValidator>

=head1 AUTHOR

Sebastian Riedel, C<sri@cpan.org>

=head1 COPYRIGHT

This program is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut

1;

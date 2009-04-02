package Catalyst::Plugin::FormValidator;

use strict;
use NEXT;
use Data::FormValidator;

our $VERSION = '0.03';

=head1 NAME

DEPRECATED - Catalyst::Plugin::FormValidator - Unmaintained Data::FormValidator
plugin for Catalyst.

=head1 SYNOPSIS

    use Catalyst 'FormValidator';

    $c->form( optional => ['rest'] );
    print $c->form->valid('rest');

=head1 WARNING

This code is not maintained, and is disrecommended for use in new applications.

Instead, it is recommended to use newer, better supported modules such as:

=over

=item L<Catalyst::Controller::HTML::FormFu>

=item L<Catalyst::Controller::FormBuilder>

=back

Note that not only is this plugin disrecommended (as it takes over the global
C<< $c->form >> method, rather than being applyable in only part of your
application), but L<Data::FormValidator> itself is not recommended for use.

=head1 DESCRIPTION

This plugin uses L<Data::FormValidator> to validate and set up form data
from your request parameters. It's a quite thin wrapper around that
module, so most of the relevant information can be found there.

=head2 EXTENDED METHODS

=head3 prepare

Sets up $c->{form}

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

Returns a L<Data::FormValidator::Results> object.

    $c->form->valid('rest');

The actual parameters sent to $c->form are the same as the profile in
L<Data::FormValidator>'s check function.

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

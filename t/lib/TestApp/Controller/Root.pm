package TestApp::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub form_test : Local{
	my ($self, $c) = @_;
	$c->res->body(qq{
		<form name="test" action="POST">
		<input type="text" name="testinput" />
		<input type="submit" name="press" />
		</form>
	});
	$c->form(required => ['testinput']);
	if ($c->req->param('testinput')) {
		my $result = $c->form->valid('testinput');
		$c->res->body($result);
	}
}

__PACKAGE__->meta->make_immutable;
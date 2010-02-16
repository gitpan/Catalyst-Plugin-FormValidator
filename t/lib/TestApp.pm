package    # Hide from PAUSE
  TestApp;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;
use Catalyst qw/
  -Debug
  FormValidator
  /;
extends 'Catalyst';
TestApp->setup;
__PACKAGE__->meta->make_immutable;

#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use HTTP::Request::Common;
use FindBin;
use lib "$FindBin::Bin/lib";
use HTTP::Request::Common;
use Data::Dumper;
BEGIN { use_ok 'Catalyst::Test','TestApp' }

my $response = request GET "/form_test";
ok( $response->is_success, "got initial url");

my $response2 = request POST '/form_test', 
Content_Type => 'form-data',
Content => [
    testinput => "test"
];

like($response->content, qr/testinput/, "successful post is proper");

my $response3 = request POST '/form_test', 
Content_Type => 'form-data',
Content => [
    testinput => "test"
];

like($response->content, qr//, "unsuccessful post is proper");

done_testing;
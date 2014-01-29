#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
use Test::Most;
use Test::WWW::Mechanize::PSGI;

use Dancer qw(:syntax);
use Cwd;

set apphandler => "PSGI";

my $mech = Test::WWW::Mechanize::PSGI->new( app => do( getcwd() . "/script/test_dancer_app.pl" ) );

subtest "Ensure legacy_get directs to correct controller" => sub {
    $mech->get_ok("/legacy/get");

    cmp_ok($mech->content, "eq", "Testing Get", "Correct Content");
    cmp_ok($mech->status, '==', 200, "Returns 200");

    my $updated_response = $mech->get_ok("/good/get");

    cmp_ok($mech->content, "eq", "Testing Get", "Correct Content");
    cmp_ok($mech->status, '==', 200, "Returns 200");
};

done_testing;

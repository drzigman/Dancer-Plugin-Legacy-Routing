package TestDancerPluginLegacyRouting;

use strict;
use warnings;

use Dancer;
use Dancer::Plugin::Legacy::Routing;


get        "/good/get"   => \&test_get;
legacy_get "/legacy/get" => \&test_get;

sub test_get {
    status 200;
    return "Testing Get";
}

1;

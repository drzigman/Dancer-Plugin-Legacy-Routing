package TestDancerPluginLegacyRouting;

use strict;
use warnings;

use Dancer;
use Dancer::Plugin::Legacy::Routing;


get        "/good/get"   => \&test_get;
legacy_get "/legacy/get" => \&test_get;

get        "/good/get/:var"   => \&test_get_with_var;
legacy_get "/legacy/get/:var" => \&test_get_with_var;

get        "/good/get/:var/params"   => \&test_get_with_params;
legacy_get "/legacy/get/:var/params" => \&test_get_with_params;

sub test_get {
    status 200;
    return "Testing Get";
}

sub test_get_with_var {
    my $var = params->{'var'};

    status 200;
    return "Testing Get, Var Value is = " . $var;
}

sub test_get_with_params {
    my $var1 = params->{'var1'};
    my $var2 = params->{'var2'};

    status 200;
    return "Testing Get, Var1 Value is = " . $var1
        . " Var2 Value is = " . $var2;
}
1;

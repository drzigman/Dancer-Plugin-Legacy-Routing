#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
use Test::Most;

use FindBin;
use lib "$FindBin::Bin/../bin/";

use TestDancerPluginLegacyRouting;
use Dancer::Test;

subtest "Ensure legacy_get directs to correct controller" => sub {
    route_exists        [ GET => '/legacy/get' ], "GET /legacy/get is handled";
    response_content_is [ GET => '/legacy/get' ], "Testing Get",
      "got expected response content for /legacy/get";

    route_exists        [ GET => '/good/get' ], "GET /good/get is handled";
    response_content_is [ GET => '/good/get' ], "Testing Get",
      "got expected response content for /good/get";
};

subtest "Legacy Route Called Logged when Logging Enabled" => sub {
    route_exists [ GET => '/legacy/get' ], "GET /legacy/get is handled";
    is_deeply( read_logs,
        [
            {
                level => 'info',
                message =>
                  "Legacy Route GET '/legacy/get' referred from '(none)'"
            }
        ],
        "Logged Call to Legacy Route"
    );

    route_exists [ GET => '/good/get' ], "GET /good/get is handled";
    is_deeply( read_logs, [], "No Additional Log Entries Generated" );
};

done_testing;

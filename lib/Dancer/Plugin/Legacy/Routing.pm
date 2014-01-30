package Dancer::Plugin::Legacy::Routing;

use strict;
use warnings;

use Dancer qw(:syntax);
use Dancer::Plugin;

use Data::Dumper;
register legacy_get => sub {
    my $pattern = shift;
    my $code    = shift;

    my $conf = plugin_setting();

    my $hooked_code = sub {
        $conf->{log} and log_request();
        &$code();
    };

    get $pattern, $hooked_code;
};

#register legacy_post   => sub {
#register legacy_put    => sub {
#register legacy_delete => sub {
#register legacy_head   => sub {
#register legacy_patch  => sub {

sub log_request {
    info "Legacy Route "
      . request->method . " '"
      . request->path
      . "' referred from '"
      . ( defined request->referer ? request->referer : "(none)" ) . "'";

    return;
}

register_plugin;
1;

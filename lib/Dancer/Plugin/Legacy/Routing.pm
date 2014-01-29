package Dancer::Plugin::Legacy::Routing;

use strict;
use warnings;

use Dancer ':syntax';
use Dancer::Plugin;

set 'show_errors'  => 1;

register legacy_get    => sub {
    my ($self, @args) = plugin_args(@_);
#    my $conf          = plugin_setting();

#    $conf->{log} and _generate_log_entry();

    get @args;
};

#register legacy_post   => sub {
#register legacy_put    => sub {
#register legacy_delete => sub {
#register legacy_head   => sub {
#register legacy_patch  => sub {

sub _generate_log_entry {
    info "Legacy Route " . request->method . " '" . request->uri
        . "' called by '" . request->address . "' referred from '"
        . request->referer . "'";
}

register_plugin;
1;

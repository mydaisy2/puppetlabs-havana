# Profile to install the horizon web service
class havana::profile::horizon {
  class { '::horizon':
    fqdn            => [ '127.0.0.1', hiera('havana::controller::address::api'), $::fqdn ],
    secret_key      => hiera('havana::horizon::secret_key'),
    cache_server_ip => hiera('havana::controller::address::management'),

  }

  # public API access
  firewall { '00080 - Apache (Horizon)':
    proto  => 'tcp',
    state  => ['NEW'],
    action => 'accept',
    port   => '80',
  }

  # public API access
  firewall { '00443 - Apache SSL (Horizon)':
    proto  => 'tcp',
    state  => ['NEW'],
    action => 'accept',
    port   => '443',
  }

  if $::selinux and str2bool($::selinux) != false {
    selboolean{'httpd_can_network_connect':
      value      => on,
      persistent => true,
    }
  }

}

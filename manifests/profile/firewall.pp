class havana::profile::firewall {
  #  Firewall {
  #  before  => Class['::havana::profile::firewall::post'],
  #  require => Class['::havana::profile::firewall::pre'],
  #}
  class { '::havana::profile::firewall::pre': } ->
  class { '::havana::profile::firewall::puppet': } ->
  class { '::havana::profile::firewall::post': }
}

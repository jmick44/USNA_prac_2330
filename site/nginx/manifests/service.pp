class nginx::service (
  $service = $nginx::params::service,
) inherits nginx::params {

  service { $service:
    ensure => running,
    enable => true,
  }
}

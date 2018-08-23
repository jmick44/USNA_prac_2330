class nginx {

  class { 'nginx::install': } -> class { 'nginx::config': } ~> class { 'nginx::service': }

 contains nginx::install
 contains nginx::config
 contains nginx::service

}

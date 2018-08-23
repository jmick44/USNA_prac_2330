class nginx::install (
  $package = $nginx::params::package,
) inherits nginx::params {
   
   package { $package:
      ensure => present,
   }


}
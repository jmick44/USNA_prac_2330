class webapp::params {
  case $facts['os']['family'] {
    'RedHat': {
       $docroot = '/var/www/html'
    }
    'Debian': {
       $docroot = '/var/www'
    }
    default: {
      fail("Module ${module_name} is not supported on ${facts['os']['family']}")
    }
  }
}

class test (
  $message = "This is the default message",
){ 

  notify { "The message is: ${message}": }

  file { '/var/www':
    ensure => directory,
  }

  test::vhost { ['kermit.puppet.com', 'animal.puppet.com', 'gonzo.puppet.com']:
    owner => 'root',
    group => 'root',
  }

}
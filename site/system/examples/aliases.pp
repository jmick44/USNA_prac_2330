user { 'admin':
  ensure => present,
}

class { 'system::aliases':
  admin   => 'admin',
  require => User['admin'],
}


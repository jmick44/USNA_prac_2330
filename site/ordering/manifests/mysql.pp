class ordering::mysql {
  # How do we make sure these classes don't float off the relationship graph?
  class { '::mysql::server':
    root_password    => 'strongpassword',
  }

  class { '::mysql::bindings':
    php_enable  => true,
    perl_enable => true,
  }

  contain mysql::server
  contain mysql::bindings

}

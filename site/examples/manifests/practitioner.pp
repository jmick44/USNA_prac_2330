class examples::practitioner {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { '/root/example.pp':
    ensure => file,
    source => 'puppet:///modules/examples/practitioner/example.pp',
  }

  package { 'cowsay':
    ensure => present,
  }
}

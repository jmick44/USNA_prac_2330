define test::vhost (
  $owner,
  $group,
  $mode = '0644',
){
  file { "/var/www/${title}":
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }

  file { "/var/www/${title}/${title}.conf":
    ensure  => file,
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => "The is the conf for ${title} that will display a cool website",
  }

  file { "/tmp/${title}.config":
    ensure  => file,
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => "The is the apache config that tells apache that there is a new virtual host called  ${title}",
  }
}
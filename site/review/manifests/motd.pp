class review::motd (
  $message = 'This is the default message',
){

  file { '/etc/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0777',
    content => epp('review/motd.epp', {message => $message,}),

  }
}
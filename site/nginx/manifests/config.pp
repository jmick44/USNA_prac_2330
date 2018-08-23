class nginx::config (
  $owner    = $nginx::params::owner,
  $group    = $nginx::params::group,
  $docroot  = $nginx::params::docroot,
  $confdir  = $nginx::params::confdir,
  $blockdir = $nginx::params::blockdir,
  $logdir   = $nginx::params::logdir,
  $user     = $nginx::params::user,
) inherits nginx::params {

  File {
    owner => $owner,
    group => $group,
    mode  => '0644',
  }

  file { ["$docroot","$confdir","$blockdir"]:
    ensure => directory,
  }
  
  file { "${docroot}/index.html":
    ensure  => file,
    content => epp('nginx/index.html.epp'),
    require => File["$docroot"],
  }
  
  file { "${confdir}/nginx.conf":
    ensure  => file,
    content => epp('nginx/nginx.conf.epp',
                    {
                       user     => $user,
                       logdir   => $logdir,
                       confdir  => $confdir,
                       blockdir => $blockdir,
                    }),
    require => File["$confdir"],
  }
  
  file { "${blockdir}/default.conf":
    ensure  => file,
    mode    => '0664',
    content => epp('nginx/default.conf.epp', { docroot => $docroot, }),
    require => File["$blockdir"],
  }
}
  
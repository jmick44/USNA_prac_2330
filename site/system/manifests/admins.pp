class system::admins {
  #require mysql::server
  
  $retired = ['ralph']
  $admins = {
    'zack'   => { max_queries_per_hour => 1200 },
    'monica' => { max_queries_per_hour => 600 },
    'brad'   => { max_queries_per_hour => 600 },
    'luke'   => { max_queries_per_hour => 600 },
  }
  
  $admins.each |$user, $params| {
  
    user { $user:
      ensure     => present,
      managehome => true,
    }
    
    mysql_user { "${user}@localhost":
      ensure => present,
      max_queries_per_hour => $params['max_queries_per_hour'],
    }
    
  }
  
  $retired.each |$user| {
  
    user { $user:
      ensure => absent,
    }
    
    mysql_user { "${user}@localhost":
      ensure => absent,
    }
    
  }
}  
class webapp::wordpress {
  include ::wordpress

  # override load balancer to 'wordpress' listening service
  class { 'webapp':
    docroot  => '/opt/wordpress',
    app_name => 'wordpress',
  }
  
}

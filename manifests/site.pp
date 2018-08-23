## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# PRIMARY FILEBUCKET
# This configures puppet agent and puppet inspect to back up file contents when
# they run. The Puppet Enterprise console needs this to display file contents
# and differences.

# Disable filebucket by default for all File resources:
File { backup => false }

# Randomize enforcement order to help understand relationships
ini_setting { 'random ordering':
  ensure  => present,
  path    => "${settings::confdir}/puppet.conf",
  section => 'agent',
  setting => 'ordering',
  value   => 'title-hash',
}

node 'jaime.puppetlabs.vm' {
  include role::classroom
  
  #include review
  
  class { 'review':
    user => 'beavis',
  }
  
  class { 'review::motd':
    message => 'Puppet is awesome!!!!!!',
  }
  
  include system::hosts
  
  #include test
  
  class { 'test':
    message => 'My explicit message',
  }
  
  include system::aliases
  
  #class { 'system::aliases':
  #  admin => 17,
  #}
  
  include system::admins
  
  #include ordering
  
  include system::classroom
  
  $roothome = homedir('root')
  $testhome = homedir('test')
  
  notify { "Root's homedir is ${roothome}": }
  notify { "Test's homedir is ${testhome}": }
  
  include files
  
  include kerberos
  
  include webapp::wordpress
}

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  include role::classroom
}

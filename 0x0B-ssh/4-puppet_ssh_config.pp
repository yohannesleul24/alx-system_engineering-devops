# Using Puppet, create a manifest that kills a process named killmenow
file_line { '/etc/ssh/ssh_config':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '    PasswordAuthentication no;    IdentityFile ~/.ssh/holberton',
}

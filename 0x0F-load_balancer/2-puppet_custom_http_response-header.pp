# Custom HTTP header response
exec {'exec_1':
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx',
  path     => ['/usr/bin', '/bin'],
  provider => shell,
  returns  => [0,1]
}

exec {'exec_2':
  require  => Exec['exec_1'],
  command  => 'sudo sed -i "s/server_name _;/server_name _;\n\tadd_header X-Served-By \$hostname;/" /etc/nginx/sites-enabled/default',
  path     => ['/usr/bin', '/bin'],
  provider => shell,
}

exec {'exec_3':
  require => Exec['exec_2'],
  command => 'sudo service nginx start',
  path    => ['/usr/bin', '/bin', '/usr/sbin'],
  returns => [0,1]
}

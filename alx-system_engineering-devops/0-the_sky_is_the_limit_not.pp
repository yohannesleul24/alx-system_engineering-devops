# Sky is the limit, let's bring that limit higher
exec {'exec_1':
  command => 'sed -i "s/15/15000/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/'
}

exec {'exec_2':
  require  => Exec['exec_1'],
  command => 'sudo nginx restart',
  path    => '/etc/init.d/'
}

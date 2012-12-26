class nginx::config {

  file { '/etc/nginx/sites-enabled/default':
    ensure => absent
  }

  file { '/etc/nginx/sites-enabled/site':
    ensure => present,
    source => 'puppet:///modules/nginx/site.conf',
    mode   => '0644',
  }

  file { '/usr/share/nginx/www':
    ensure  => directory,
    source  => 'puppet:///modules/nginx/www',
    recurse => true,
    purge   => true,
  }

}
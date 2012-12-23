class squidguard::config inherits squidguard::params {

  file { "${confdir}/${conffile}":
    ensure => present,
    source => 'puppet:///modules/squidguard/squidGuard.conf',
    mode   => '0644',
    owner  => $squiduser,
    group  => $squiduser,
  }

  file { "${confdir}/update-blacklists.sh":
    ensure  => present,
    content => template('squidguard/update-blacklists.sh.erb'),
    notify  => Exec [ 'update-blacklists.sh' ],
  }

  exec { 'update-blacklists.sh':
    cwd         => $confdir,
    command     => 'sh update-blacklists.sh',
    refreshonly => true,
    notify      => Class [ 'squidguard::service' ]
  }

  exec { 'link-squid-squidguard':
    command => "echo url_rewrite_program ${bin} -c ${confdir}/${conffile} >> ${squidconf}",
    unless  => "grep ${conffile} ${squidconf}",
    notify  => Class [ 'squidguard::service' ],
  }

  exec { 'configure-squid-localnet':
    command => "sed -i 's/#acl localnet src 192\\.168\\.0\\.0\\/16.*/acl localnet src 192\\.168\\.100\\.0\\/24/g' ${squidconf}",
    onlyif  => "grep -F '#acl localnet src 192.168.0.0/16' ${squidconf}",
    notify  => Class [ 'squidguard::service' ],
  }

  exec { 'allow-squid-localnet':
    command => "sed -i 's/#http_access allow localnet/http_access allow localnet/g' ${squidconf}",
    onlyif  => "grep -F '#http_access allow localnet' ${squidconf}",
    notify  => Class [ 'squidguard::service' ],
  }

}
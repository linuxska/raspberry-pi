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
    command   => "echo url_rewrite_program ${bin} -c ${confdir}/${conffile} >> ${squidconf}",
    unless    => "grep ${conffile} ${squidconf}",
    notify    => Class [ 'squidguard::service' ],
    require   => File [ "${confdir}/${conffile}" ],
  }

}
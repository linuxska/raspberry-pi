class squidguard::config inherits squidguard::params {

  file { "${confdir}/${conffile}":
    ensure => present,
    source => 'puppet:///modules/squidguard/squidGuard.conf',
    mode   => '0644',
    owner  => $squiduser,
    group  => $squiduser,
  }

  file { "${confdir}/install-blacklists.sh":
    ensure  => present,
    content => template('squidguard/install-blacklists.sh.erb'),
  }

  exec { 'install-blacklists.sh':
    cwd       => $confdir,
    command   => 'sh install-blacklists.sh',
    path      => [ '/bin' ],
    logoutput => on_failure,
    require   => File [ "${confdir}/install-blacklists.sh" ],
    notify    => Class [ 'squidguard::service' ]
  }

}
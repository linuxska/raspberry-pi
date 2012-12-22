class squidguard::config inherits squidguard::params {

  file { "${confdir}/${conffile}":
    ensure => present,
    source => 'puppet:///modules/squidguard/squidGuard.conf',
    mode   => '0644',
    owner  => $squiduser,
    group  => $squiduser,
  }

  file { "${confdir}/download-blacklists.sh":
    ensure => present,
    content => template('squidguard/download-blacklists.sh.erb'),
  }

}
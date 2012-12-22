class squidguard::config inherits squidguard::params {

  file { "${confdir}/${conffile}":
    ensure => present,
    source => 'puppet:///modules/squidguard/squidguard.conf',
    mode   => '0644',
  }

  file { "${confdir}/download-blacklists.sh":
    ensure => present,
    content => template('squidguard/download-blacklist.sh.erb'),
  }

}
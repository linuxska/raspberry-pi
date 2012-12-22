class squidguard::service {

  service { 'squid3':
    ensure => running,
  }

}
class nginx::service {

  service { 'nginx':
    ensure => running,
    name   => $nginx::params::service_name,
  }

}
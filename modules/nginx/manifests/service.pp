class nginx::service inherits nginx::params {

  service { 'nginx':
    ensure => running,
    name   => $nginx::params::service_name,
  }

}
class nginx::install inherits nginx::params {

  package { 'nginx':
    ensure => present,
    name   => $nginx::params::package_name,
  }

}
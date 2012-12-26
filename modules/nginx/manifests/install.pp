class nginx::install {

  package { 'nginx':
    ensure => present,
    name   => $nginx::params::package_name,
  }

}
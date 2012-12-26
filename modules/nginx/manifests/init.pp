class nginx {

  class { 'nginx::install': } ->
  class { 'nginx::config':  } ~>
  class { 'nginx::service': }

}
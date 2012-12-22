class squidguard {

  class { 'squidguard::install' } ->
  class { 'squidguard::config' } ~>
  class { 'squidguard::service' }

}
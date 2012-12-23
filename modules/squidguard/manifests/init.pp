class squidguard {

  Exec {
    cwd       => '/tmp',
    logoutput => on_failure,
    path      => [ '/bin', '/usr/bin' ],
  }

  class { 'squidguard::install': } ->
  class { 'squidguard::config': } ~>
  class { 'squidguard::service': }

}
class bash::aliases {

  file { '/home/pi/.bash_aliases':
    ensure => present,
    content => 'alias ll="ls -l"',
    owner   => 'pi',
  }

}
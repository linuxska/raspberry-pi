node default {

  include bash
  include squidguard

  package { [
    'lxappearance',
    'lxde',
    'lxde-common',
    'lxde-core',
    'lxde-icon-theme',
    'lxmenu-data',
    'lxinput',
    'lxpanel',
    'lxpolkit',
    'lxrandr', 
    'lxsession', 
    'lxsession-edit', 
    'lxshortcut', 
    'lxtask', 
    'lxterminal',
    'wpasupplicant' ]:
    ensure => absent,
  }

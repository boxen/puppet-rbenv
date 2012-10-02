class rbenv {
  require github::config

  $root = "${github::config::home}/rbenv"

  file { [$root, "${root}/versions"]:
    ensure => directory
  }

  package { ['ruby-build', 'rbenv']:
    ensure => latest
  }

  file { "${github::config::envdir}/rbenv.sh":
    source  => 'puppet:///modules/rbenv/rbenv.sh',
    require => File[$github::config::envdir]
  }
}

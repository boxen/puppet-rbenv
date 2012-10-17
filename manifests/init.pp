# Install rbenv and ruby-build, and add environment variables to use them.
#
# Usage:
#
#     include rbenv

class rbenv {
  require boxen::config

  $root = "${boxen::config::home}/rbenv"

  file { [$root, "${root}/versions"]:
    ensure => directory
  }

  # we ensure latest of ruby-build for up-to-date ruby definitions
  package { ['ruby-build', 'rbenv']:
    ensure => latest
  }

  file { "${boxen::config::envdir}/rbenv.sh":
    source  => 'puppet:///modules/rbenv/rbenv.sh'
  }
}

# Install rbenv and ruby-build, and add environment variables to use them.
#
# Usage:
#
#     include rbenv

class rbenv {
  require boxen::config

  $root = "${boxen::config::home}/rbenv"

  file {
    [$root, "${root}/versions", "${root}/rbenv.d", "${root}/rbenv.d/install"]:
      ensure => directory;
    "${root}/rbenv.d/install/00_try_to_download_ruby_version.bash":
      ensure => present,
      mode   => '0755',
      source => 'puppet:///modules/rbenv/try_to_download_ruby_version.bash';
  }

  package {
    'rbenv':      ensure => '0.4.0' ;
    'ruby-build': ensure => '20130104' ;
  }

  file { "${boxen::config::envdir}/rbenv.sh":
    source  => 'puppet:///modules/rbenv/rbenv.sh'
  }
}

# Bugzilla is a Web-based general-purpose bugtracker and testing tool 
# originally developed and used by the Mozilla project, and licensed under the 
# Mozilla Public License.
#
# This class is designed to install and setup Bugzilla.
class bugzilla {
	$res = "bugzilla"

  include apache

  package {['perl', 'make', 'gcc']:
    ensure => present,
  }
  file { '/root/bz_package.sh':
    ensure => present,
    owner => root,
    group => root,
    mode => 755,
    source => 'puppet:///modules/bugzilla/bz_package.sh',
    notify => Exec['/root/bz_package.sh'],
    require => Package['apache'],
  }
  exec { '/root/bz_package.sh':
    command => '/root/bz_package.sh',
    refreshonly => true,
    require => File['/root/bz_package.sh'],
  }
  file { '/var/www/bugzilla':
    ensure => link,
    target => '/var/www/bugzilla-4.4.4',
    require => Exec['/root/bz_package.sh'],
  }
  exec { '/usr/bin/perl checksetup.pl':
    command => '/usr/bin/perl checksetup.pl',
    path => '/var/www/bugzilla/',
    refreshonly => true,
    require => File['/var/www/bugzilla/'],
  }
  exec { '/usr/bin/perl install-module.pl --all':
    command => '/usr/bin/perl install-module.pl --all',
    path => '/var/www/bugzilla/',
    refreshonly => true,
    require => File['/var/www/bugzilla/'],
    onlyif => ['/usr/bin/perl checksetup.pl'], 
  }



  # [CHECK] had to apt-get install make and gcc
  # [CHECK] ./checksetup.pl
  # ./checksetup.pl --check-modules
  # /usr/bin/perl install-module.pl --all
  # update variables in ./localconfig: create_htaccess, webservergroup, use_suexec, db_driver, db_host, db_name, db_user, db_pass, db_port, db_sock, db_check, index_html, cvsbin, interdiffbin, diffpath, site_wide_secret

	# Create a dir for puppet to work with config
	file {"/etc/bugzilla/.puppet":
		ensure => directory,
		mode => 0755,
		owner => "root",
		group => "root",
	}
}

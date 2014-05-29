# Bugzilla is a Web-based general-purpose bugtracker and testing tool 
# originally developed and used by the Mozilla project, and licensed under the 
# Mozilla Public License.
#
# This class is designed to install and setup Bugzilla.
class puppet_bugzilla {
	$res = "bugzilla"

	# These are the requirements for running a fully-functional bugzilla
	# # The package should do this perhaps, but they are optional.
	# package {
	# 	[
	# 	# "bugzilla", # Don't know what this is supposed to do...

	# 	# The following list was working out using checksetup.pl 
	# 	# Packages are to be installed by Ubuntu
	# 	# "perl-GD",
	# 	"libgd-gd2-perl",
	# 	# "perl-Chart",
	# 	"libchart-perl",
	# 	# "perl-Template-GD",
	# 	"libhtml-template-perl",
	# 	# "perl-GDTextUtil",
	# 	"libgd-text-perl",
	# 	# "perl-GDGraph",
	# 	"libgd-graph-perl",
	# 	# "perl-XML-Twig",
	# 	"libxml-twig-perl",
	# 	# "perl-MIME-tools",
	# 	"libmime-tools-perl",
	# 	# "perl-PatchReader",
	# 	"",
	# 	# "ImageMagick-perl",
	# 	"libgraphics-magick-perl",
	# 	# "perl-Authen-SASL",
	# 	"libauthen-sasl-perl",
	# 	# "perl-Authen-Radius",
	# 	"libauthen-radius-perl",
	# 	# "perl-HTML-Scrubber",
	# 	"libhtml-scrubber-perl",
	# 	# "perl-TheSchwartz",
	# 	"libtheschwartz-perl",
	# 	# "perl-Daemon-Generic",
	# 	"libdaemon-generic-perl",
	# 	]:
	# 		ensure => installed
	# }

	# Create a dir for puppet to work with config
	file {"/etc/bugzilla/.puppet":
		ensure => directory,
		mode => 0755,
		owner => "root",
		group => "root",
	}
}

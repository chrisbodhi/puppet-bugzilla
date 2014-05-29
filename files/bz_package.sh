#!/bin/bash
BZ_LOCATION='http://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla-4.4.4.tar.gz'
BZ_ARCHIVE='bugzilla-4.4.4.tar.gz'
cd /var/www
wget $BZ_LOCATION && tar -zxvf $BZ_ARCHIVE
chmod 755 bugzilla-4.4.4
chgrp www-data bugzilla-4.4.4
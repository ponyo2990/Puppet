#this file will be created in /etc/puppetlabs/code/environments/production/modules/webserver/manifests/
#vi parameters.pp


class webserver::parameters {
	if $::osfamily == 'Redhat' {
		$packagename = 'httpd'
		$configfile = '/etc/httpd/conf/httpd.conf'
		$configsource = 'puppet:///modules/webserver/httpd.conf'
		$vhostfile = '/etc/httpd/conf.d/vhost.conf'
	} elsif $::osfamily == 'Debian' {
                $packagename = 'apache2'
                $configfile = '/etc/apache2/conf/httpd.conf'
                $configsource = 'puppet:///modules/webserver/apache2.conf'
                $vhostfile = '/etc/apache2/sites-enabled/vhost.conf'
	} else {
	}
}


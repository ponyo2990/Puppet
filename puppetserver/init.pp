#Directory structure of module

#contains manifests or puppet programs files with .pp extension
#$modulepath/<module name>/manifests


#contains files to be created on agents using 'file' resource type where content is static
#$modulepath/<module name>/files


#contains files to be created on agents using 'file' resource type where content is going to be dynamic and will change
#$modulepath/<module name>/templates

#everything will be included in the class file
#this should be the contect of $modulepath/webserver/manifests/init.pp file
class webserver {
	package {'httpd':
	ensure => present
	}

file { '/etc/httpd/conf/httpd.conf' :
	ensure => file,
	source => 'puppet:///modules/webserver/httpd.conf',
	require => Package['httpd'],
}

#the source file for the resource type is located in the path:
#$modulepath/<module name>/files
#eg : $modulepath/webserver/files/httpd.conf


#templates

file { '/etc/httpd/conf.d/vhost.conf' :
	ensure => file,
	content => template('webserver/vhost.conf.erb'),
	require => Package['httpd'],
}


#the source template for the resource type is located in the path:
#$modulepath/<module name>/templates
#eg : $modulepath/webserver/templates/vhost.conf

#template file with an .erb extension vhost.conf.erb :example
#<VirtualHost *:80>
#	ServerName <%=@fqdn%=>
#	DocumentRoot /var/www/html
#</VirtualHost>



#Service
service { 'httpd':
	ensure => running,
	enable => true,
	hasrestart => true,
	require => [File['/etc/httpd/conf/httpd.conf'],File['/etc/httpd/conf/vhost.conf']]
}
} #end of class webserver

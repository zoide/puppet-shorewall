class shorewall::debian inherits shorewall::base {
    case $shorewall_startup {
        '' : {
            $shorewall_startup = "1"
        }
    }
    file {
        '/etc/default/shorewall' :
            content => template("shorewall/debian_default.erb"),
            require => Package['shorewall'],
            notify => Service['shorewall'],
            owner => root,
            group => 0,
            mode => 0644,
	    backup => false ;
    }
    Service['shorewall'] {
        status => '/sbin/shorewall status'
    }
}

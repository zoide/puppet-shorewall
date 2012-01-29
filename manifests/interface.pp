define shorewall::interface ($zone,
    $interface = '',
    $broadcast = 'detect',
    $options = 'tcpflags,blacklist,routefilter,nosmurfs,logmartians',
    $dhcp = false,
    $order = 100) {
    if $dhcp {
        $options_real = "${options},dhcp"
    }
    else {
        $options_real = $options
    }
    $iface_real = $interface ? {
        '' => $name,
        default => $interface,
    }
    shorewall::entry {
        "interfaces.d/${order}-${name}" :
            line => "${zone} ${iface_real} ${broadcast} ${options_real}",
    }
}


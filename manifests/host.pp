define shorewall::host(
    $zone,
    $hosts="",
    $options = 'tcpflags,blacklist,norfc1918',
    $order='100'
){
    $name_real = $hosts ? {
        "" => $name,
        default => $hosts,
    }
    shorewall::entry{"hosts.d/${order}-${name}":
        line => "${zone} ${name_real} ${options}"
    }
}


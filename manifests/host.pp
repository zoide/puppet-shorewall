define shorewall::host ($zone,
    $host = "",
    $options = 'tcpflags,blacklist,norfc1918',
    $order = '100') {
    $name_real = $host ? {
        "" => $name,
        default => $host,
    }
    shorewall::entry {
        "hosts.d/${order}-${name}" :
            line => "${zone} ${name_real} ${options}"
    }
}


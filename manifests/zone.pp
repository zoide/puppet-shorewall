define shorewall::zone ($type,
    $options = '-',
    $opt_in = '-',
    $opt_out = '-',
    $parent = '-',
    $order = 100) {
    $real_name = $parent ? {
        '-' => $name,
        default => "${name}:${parent}"
    }
    shorewall::entry {
        "zones.d/${order}-${name}" :
            line => "${real_name} ${type} ${options} ${opt_in} ${opt_out}"
    }
}


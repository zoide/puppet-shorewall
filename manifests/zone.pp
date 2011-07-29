define shorewall::zone(
    $type,
    $options = '-',
    $options_in = '-',
    $options_out = '-',
    $parent = '-',
    $order = 100
){
    $real_name = $parent ? { '-' => $name, default => "${name}:${parent}" }
    shorewall::entry { "zones.d/${order}-${name}":
        line => "${real_name} ${type} ${options} ${options_in} ${options_out}"
    }
}


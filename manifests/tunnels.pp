define shorewall::tunnel(
    $type='',
    $zone,
    $gateway,
    $gateway_zone='',
    $order = 100,
    $ensure = "present"
){
    $type_r = $type ? {
        '' => $name,
        default => $type,
    }
    shorewall::entry { "tunnels.d/${order}-${name}":
        line => "${type_r} ${zone} ${gateway} ${gateway_zone}",
    }
}


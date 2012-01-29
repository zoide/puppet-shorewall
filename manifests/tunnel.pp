define shorewall::tunnel ($type = '',
    $zone,
    $gateway,
    $gatewayzone = '',
    $order = '100') {
    $type_real = $type ? {
        "" => $name,
        default => $type,
    }
    entry {
        "tunnels.d/${order}-${name}" :
        #TYPE           ZONE          GATEWAY          GATEWAY ZONE
            line => "${type_real} ${zone} ${gateway} ${gatewayzone}",
    }
}
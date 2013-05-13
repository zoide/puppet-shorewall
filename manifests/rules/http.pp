class shorewall::rules::http ($destination="\$FW") {
    shorewall::rule { 'net-me-http-tcp':
        source          => 'net',
        destination     => $destination,
        proto           => 'tcp',
        destinationport => '80',
        order           => 240,
        action          => 'ACCEPT';
    }
}

class shorewall::rules::smtp ($destination="\$FW") {
    shorewall::rule { 'net-me-smtp-tcp':
        source          => 'net',
        destination     => $destination,
        proto           => 'tcp',
        destinationport => '25',
        order           => 240,
        action          => 'ACCEPT';
    }
}

class shorewall::rules::imap ($destination="\$FW") {
    shorewall::rule {
        'net-me-tcp_imap_s':
            source          =>      'net',
            destination     =>      $destination,
            proto           =>      'tcp',
            destinationport =>      '143,993',
            order           =>      260,
            action          =>      'ACCEPT';
    }
}

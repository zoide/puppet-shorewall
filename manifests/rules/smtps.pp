class shorewall::rules::smtps ($destination="\$FW"){
	shorewall::rule {'net-me-smtps-tcp':
        source          =>      'net',
        destination     =>      $destination,
        proto           =>      'tcp',
        destinationport =>      '465',
        order           =>      240,
        action          =>      'ACCEPT';
	}
}

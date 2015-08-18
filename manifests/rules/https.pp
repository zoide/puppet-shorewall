class shorewall::rules::https ($destination = "\$FW", $originaldest = '-',) {
  shorewall::rule { 'net-me-https-tcp':
    source          => 'net',
    destination     => $destination,
    proto           => 'tcp',
    destinationport => '443',
    order           => 240,
    originaldest    => $originaldest,
    action          => 'ACCEPT';
  }
}

class shorewall::rules::postgres (
  $destination = '$FW') {
  shorewall::rule { 'net-me-tcp_postgres':
    source          => 'net',
    destination     => $destination,
    proto           => 'tcp',
    destinationport => '5432',
    order           => 250,
    action          => 'ACCEPT';
  }
}

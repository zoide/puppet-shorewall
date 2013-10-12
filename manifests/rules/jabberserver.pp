class shorewall::rules::jabberserver (
  $destination = '$FW',
  $source      = '$FW') {
  shorewall::rule {
    'net-me-tcp_jabber':
      source          => 'net',
      destination     => $destination,
      proto           => 'tcp',
      destinationport => '5222,5269,5280',
      order           => 240,
      action          => 'ACCEPT';

    'me-net-tcp_jabber_s2s':
      source          => $source,
      destination     => 'net',
      proto           => 'tcp',
      destinationport => '5222,5269,5280',
      order           => 240,
      action          => 'ACCEPT';
  }

}

class shorewall::rules::ssh($ports=["22"], $destination='$FW') {
  $flatted_ports = join($ports,',')
  shorewall::rule { 'net-me-tcp_ssh':
    source          => 'net',
    destination     => "${destination}",
    proto           => 'tcp',
    destinationport => $flatted_ports,
    order           => 240,
    action          => 'SSH/ACCEPT';
  }
}

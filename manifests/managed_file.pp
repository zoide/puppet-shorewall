define shorewall::managed_file (
) {
  $dir = "/var/lib/puppet/modules/shorewall/${name}.d"

  common::concatenated_file { "/var/lib/puppet/modules/shorewall/${name}":
    dir  => $dir,
    mode => 0600,
  }

  File {
    mode  => 0600,
    owner => root,
    group => 0,
  }

  file {
    "${dir}/000-header":
      source => "puppet:///modules/shorewall/boilerplate/${name}.header",
      #notify => Exec["concat_${dir}"];

    "${dir}/999-footer":
      source => "puppet:///modules/shorewall/boilerplate/${name}.footer",
      #notify => Exec["concat_${dir}"];
  }
}

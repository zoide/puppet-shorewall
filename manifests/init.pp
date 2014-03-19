#
# modules/shorewall/manifests/init.pp - manage firewalling with shorewall 3.x
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.
#
# Based on the work of ADNET Ghislain <gadnet@aqueos.com> from AQUEOS
# at https://reductivelabs.com/trac/puppet/wiki/AqueosShorewall
#
# Changes:
#  * FHS Layout: put configuration in /var/lib/puppet/modules/shorewall and
#    adjust CONFIG_PATH
#  * remove shorewall- prefix from defines in the shorewall namespace
#  * refactor the whole define structure
#  * manage all shorewall files
#  * add 000-header and 999-footer files for all managed_files
#  * added rule_section define and a few more parameters for rules
#  * add managing for masq, proxyarp, blacklist, nat, rfc1918
#  * add define to manage tunnels
# adapted by immerda project group - admin+puppet(at)immerda.ch
# adapted by Puzzle ITC - haerry+puppet(at)puzzle.ch
#
class shorewall {
  case $::operatingsystem {
    gentoo         : {
      include shorewall::gentoo
    }
    ubuntu, debian : {
      import "debian.pp"
      include shorewall::debian
    }
    default        : {
      include shorewall::base
    }
  }

  file { "/var/lib/puppet/modules/shorewall":
    ensure => directory,
    force  => true,
    mode   => 0755,
    owner  => root,
    group  => 0;
  }

  # See http://www.shorewall.net/3.0/Documentation.htm
  managed_file { [
    "zones",
    "interfaces",
    "hosts",
    "policy",
    "rules",
    "masq",
    "proxyarp",
    "nat",
    "blacklist",
    "rfc1918",
    "routestopped",
    "params",
    "tunnels"]:
  }
}
node "qfx5100" { 
	netdev_device { $hostname: }

	netdev_vlan { "blue":
		vlan_id => 100,
		description => "the blue VLAN",
	}
	netdev_vlan { "green": 
		vlan_id => 200,
		description => "the green VLAN"
	}
	netdev_vlan { "red":
		vlan_id => 300,
		description => "the red VLAN",
	}
	netdev_l2_interface { 'ge-0/0/14':
		untagged_vlan => blue,
		description => "belongs to the blue VLAN"
	}
	netdev_l2_interface { 'ge-0/0/15':
		untagged_vlan => green,
		description => "belongs the green VLAN"
	}
	netdev_l2_interface { 'ge-0/0/16':
		untagged_vlan => red,
		description => "belongs to the red VLAN"
	}

	netdev_lag { "ae0":
		ensure => present,
		active => true,
		links => (['xe-0/0/10','xe-0/0/11']),
		lacp => active,
		minimum_links => 1
	}
	netdev_l2_interface { 'ae0':
		tagged_vlans => [ blue, green, red ],
		description => "Trunk to Core"
	}
}

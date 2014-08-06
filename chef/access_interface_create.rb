#
# Cookbook Name:: netdev
# Recipe:: access_interface_create
#
# Copyright 2013, Juniper Networks
#
# All rights reserved - Do Not Redistribute
#
# Physical interface creation using the following defaults:
# auto-negotiation on,MTU 1500,administativelyup
netdev_interface "ge-0/0/14" do
	description "access interface"
	action :create
end
netdev_interface "ge-0/0/15" do
	description "access interface"
	action :create
end
netdev_interface "ge-0/0/16" do
	description "access interface"
	action :create
end

# Logical interface creation, setting port mode to access (vlan_tagging false)
# and assigning interface to a VLAN

netdev_l2_interface "ge-0/0/14" do
	description "belongs to blue VLAN"
	untagged_vlan "blue"
	vlan_tagging false
	action :create
end
netdev_l2_interface "ge-0/0/15" do
	description "belongs to green VLAN"
	untagged_vlan "green"
	vlan_tagging false
	action :create
end
netdev_l2_interface "ge-0/0/16" do
	description "belongs to red VLAN"
	untagged_vlan "red"
	vlan_tagging false
	action :create
end

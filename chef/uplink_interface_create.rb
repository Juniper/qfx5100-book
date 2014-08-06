#
# Cookbook Name:: netdev
# Recipe:: uplink_interface_create
#
# Copyright 2013, Juniper Networks
#
# All rights reserved - Do Not Redistribute
#
netdev_l2_interface "xe-0/0/10" do
	action :delete
end
netdev_l2_interface "xe-0/0/11" do
	action :delete
end

# Create the LAGs
netdev_lag "ae0" do
	links [ "xe-0/0/10", "xe-0/0/11" ]
	minimum_links 1
	lacp "active"
	action :create
end

# Configure Layer 2 switching on the LAGs. Define the port modeas trunk
# (vlan_tagging true), with membership in the blue, green,and red VLANs.
netdev_l2_interface "ae0" do
	description "Uplink interface"
	tagged_vlans [ "blue", "green", "red" ]
	vlan_tagging true
	action :create
end

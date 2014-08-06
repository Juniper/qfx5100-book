#
# Cookbook Name:: netdev
# Recipe:: vlan_create
#
# Copyright 2013, Juniper Networks
#
# All rights reserved - Do Not Redistribute
#
netdev_vlan "blue" do
	vlan_id 100
	description "the blue VLAN"
	action :create
end
netdev_vlan "green" do
	vlan_id 200
	description "the green VLAN"
	action :create
end
netdev_vlan "red" do
	vlan_id 300
	description "the red VLAN"
	action :create
end

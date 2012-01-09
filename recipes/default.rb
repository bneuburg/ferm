#
# Cookbook Name:: ferm
# Recipe:: default
#
# Copyright 2012, GSI
#
# All rights reserved - Do Not Redistribute
#

package 'ferm' do
  action :upgrade
end

fermserviceaction = :enable
fermaction = :start
if node[:ferm][:active] == false
  fermserviceaction = :disable
  fermaction = :stop
end

template '/etc/ferm/ferm.conf'
  source 'ferm.conf.erb'
  mode   0644
  owner  'root'
  group  'adm'
end

service 'ferm' do
  action [ fermaction, fermserviceaction]
end

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

unless node[:ferm][:foreign_config]
  template '/etc/ferm/ferm.conf' do
    source 'ferm.conf.erb'
    mode   0644
    owner  'root'
    group  'adm'
  end
end

service 'ferm' do
  action [ fermaction, fermserviceaction]
end

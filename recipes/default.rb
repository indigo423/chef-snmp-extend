#
# Cookbook Name:: common-system
# Recipe:: default
#
# Copyright 2014, OpenNMS Project
#
# GNU Public License Version 3+
#
include_recipe "snmp"

##########
## Set environment for new users with colored bash prompt and alias
#####
case node['platform_family']
  when 'debian'
    directory node['snmp']['extend_scripts_path'] do
      recursive true
    end

    # Install default Net-SNMP extentions
    cookbook_file "apt-stats.sh" do
      path "#{node['snmp']['extend_scripts_path']}/apt-stats.sh"
      mode 0755
      action :create
    end

    template "/etc/sudoers.d/sudo-snmp-extend" do
      source "sudo-snmp-extend.erb"
      owner "root"
      group "root"
      mode "0440"
    end
end

############
## Configure SNMP agent
#######
node.default['snmp']['community'] = 'nopublic'
node.default['snmp']['full_systemview'] = 'true'
node.default['snmp']['syslocationPhysical'] = 'Good cold server room'
node.default['snmp']['syslocationVirtual'] = 'Cosy warm server'
node.default['snmp']['syscontact'] = 'poor.fellow@your-site.com'
node.default['snmp']['extend_scripts_path'] = '/opt/scripts'
node.default['snmp']['extend_scripts'] = {'apt-stats' => "'/usr/bin/sudo #{node['snmp']['extend_scripts_path']}/apt-stats.sh'"}

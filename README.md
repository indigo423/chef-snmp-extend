snmp-extend Cookbook
====================
This is a simple cookbook which allows to extend Net-SNMP agent easily.
It prepares a scripts directory, extends the Net-SNMP configuration, adds a scripts folder and make sure the SNMP user can run scripts as root.

Requirements
------------
* This cookbook requires Ubuntu 12.04 and higher

Attributes
----------
TODO: List your cookbook attributes here.

node.default['snmp']['community'] = 'nopublic'
node.default['snmp']['full_systemview'] = 'true'
node.default['snmp']['syslocationPhysical'] = 'Good cold server room'
node.default['snmp']['syslocationVirtual'] = 'Cosy warm server'
node.default['snmp']['syscontact'] = 'ronny.trommer@no42.org'
node.default['snmp']['extend_scripts'] = {'apt-stats' => "'/usr/bin/sudo /opt/scripts/apt-stats.sh'"}
node.default['snmp']['extend_scripts_path'] = '/opt/scripts'


e.g.
#### snmp-extend::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['snmp']['community']</tt></td>
    <td>String</td>
    <td>Community</td>
    <td><tt>nopublic</tt></td>
  </tr>
  <tr>
    <td><tt>['snmp']['full_systemview']</tt></td>
    <td>Boolean</td>
    <td>Give access to the full SNMP tree</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['snmp']['syslocationPhysical']</tt></td>
    <td>String</td>
    <td>System location for a physical machine</td>
    <td><tt>Good cold server room</tt></td>
  </tr>
  <tr>
    <td><tt>['snmp']['syslocationVirtual']</tt></td>
    <td>String</td>
    <td>System location for a virtual machine</td>
    <td><tt>Cosy warm server</tt></td>
  </tr>
  <tr>
    <td><tt>['snmp']['extend_scripts']</tt></td>
    <td>Hash Map</td>
    <td>Hash map with key value pair for scripts to extend</td>
    <td><tt>{'apt-stats' => "'/usr/bin/sudo #{node['snmp']['extend_scripts_path']}/apt-stats.sh'"}</tt></td>
  </tr>
  <tr>
    <td><tt>['snmp']['extend_scripts_path']</tt></td>
    <td>String</td>
    <td>Path for scripts for extending the SNMP agent</td>
    <td><tt>/opt/scripts</tt></td>
  </tr>
</table>

Usage
-----
#### snmp-extend::default
The default run will install the aptitute statistics script in the Net-SNMP agent.
The Net-SNMP is extended and the number of packages to be updated will be returned.

The script status can be integrated in any monitoring solution by polling the following object ID:

    snmpwalk -v 2c -c nopublic yourhost .1.3.6.1.4.1.8072.1.3.2.4.1.2.9.97.112.116.45.115.116.97.116.115.1

You can easily extend this cookbook with your own scripts very easily:
* Create a script in files/default which returns processed data on standard out
* Overwrite the 'extend_scripts' attribute

    {'apt-stats' => "'/usr/bin/sudo #{node['snmp']['extend_scripts_path']}/apt-stats.sh'",
     'your-test' => "'/usr/bin/sudo #{node['snmp']['extend_scripts_path']}/your-script.sh'"}


Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: ronny@opennms.org

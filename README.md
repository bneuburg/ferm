Description
===========

ferm is the firewall easy rule maker and serves as a frontend to iptables.

Check http://ferm.foo-projects.org/ for more details.

Requirements
============

Currently only supports Debian/Ubuntu Linux, but if the package has the same name for other Linux distributions and looks for the config file in the same place, that distribution should be supported too.

Attributes
==========

* `node['ferm']['active']` - States if ferm should be active, set to false if you want to disable it.
* `node['ferm']['foreign_config']` - States if ferm should avoid using the template within the ferm cookbook, useful if a different cookbook needs a more complicated ferm config.
* `node['ferm']['(input|output|forward)']['policy']` - Default policy for the respective chain, e.g. 'DROP', 'ACCEPT'
* `node['ferm']['(input|output|forward)']['extras']` - Array of extra lines to be entered to the appropriate chain, e.g. `['proto udp dport 123 ACCEPT;']`, for multiline rules use `"\n"`, for identation `"\t"`.
* `node['ferm']['input']['(ssh|http|https)']` - States the policy for ports 22. 80 and 443, e.g. 'ACCEPT' or 'DROP'.


Usage
=====

If your firewall config isn't that complicated, i.e. you don't need nat'ing or similar, use the attributes to define your config.
For more advanced ferm configs, set `['foreign_config']` to true, this will prevent the ferm cookbook touching /etc/ferm/ferm.conf, so you can have another cookbook build that file. In that case, don't forget to notify the ferm service with a restart action.


License and Author
==================


Author:: Bastian Neuburger (<b.neuburger@gsi.de>)

Copyright 2012

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
Description
===========

ferm is the firewall easy rule maker and serves as a frontend to iptables.

Check http://ferm.foo-projects.org/ for more details.

Requirements
============

Attributes
==========

[:ferm][:active]: States if ferm should be active, set to false if you want to disable it.
[:ferm][:foreign_config]: States if ferm should avoid using the template within the ferm cookbook, useful if a different cookbook needs a more complicated ferm config.
[:ferm][:(input|output|forward)][:policy]: Default policy for the respective chain, e.g. 'DROP', 'ACCEPT'
[:ferm][:(input|output|forward)][:extras]: Extra line to be entered to the appropriate chain, e.g. 'proto udp dport 123 ACCEPT;', for multiline rules use "\n"/"\t".
[:ferm][:input][:(ssh|http|https)]: States the policy for ports 22. 80 and 443, e.g. 'ACCEPT' or 'DROP'.


Usage
=====

If your firewall config isn't that complicated, i.e. you don't need nat'ing or similar, use the attributes to define your config.
For more advanced ferm configs, set [:foreign_config] to true, this will prevent the ferm cookbook touching /etc/ferm/ferm.conf, so you can have another cookbook build that file. In that case, don't forget to notify the ferm service with a restart action.

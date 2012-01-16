maintainer       "Bastian Neuburger"
maintainer_email "b.neuburger@gsi.de"
license          "Apache 2.0"
description      "Installs/Configures ferm, an iptables frontend"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{ ubuntu debian }.each do |os|
  supports os
end

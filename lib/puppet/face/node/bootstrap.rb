require 'puppet/cloudpack'

Puppet::Face.define :node, '0.0.1' do
  action :bootstrap do
    summary 'Create and initialize an instance using Puppet'
    description <<-EOT
      Creates an instance, classifies it,
      and signs its certificate. The classification is
      currently done using the Dashboard.
    EOT
    Puppet::CloudPack.add_bootstrap_options(self)
    when_invoked do |options|
      Puppet::CloudPack.bootstrap(options)
    end
  end
end

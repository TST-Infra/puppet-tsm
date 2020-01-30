#
# Vagrantfile
#
Vagrant.configure("2") do |config|
    config.vm.box = 'vsphere'
    config.vm.box_url = ENV['VSPHERE_BOX_URL']
  
    config.vm.hostname = ENV['VAGRANT_INSTANCE_NAME']
    config.vm.define ENV['VAGRANT_INSTANCE_NAME'] do |d|
    
    end
    
    config.vm.provider :vsphere do |vsphere|
        vsphere.host                    = ENV['VSPHERE_VCENTER_URL']
        vsphere.compute_resource_name   = ENV['VSPHERE_RESOURCE_NAME']
        vsphere.template_name           = ENV['VSPHERE_TEMPLATE_PATH']
        vsphere.vm_base_path            = ENV['VSPHERE_BASE_PATH']
        vsphere.name                    = ENV['VAGRANT_INSTANCE_NAME']
        vsphere.user                    = ENV['VSPHERE_USERNAME']
        vsphere.password                = :ask
        vsphere.insecure                = true
        vsphere.data_store_name         = ENV['VSPHERE_DATASTORE_NAME']
        vsphere.customization_spec_name = ENV['VSPHERE_CUSTOMIZATION_SPEC_NAME']
        vsphere.cpu_count               = 1
        vsphere.memory_mb               = 1024
    end

    config.vm.network 'private_network', ip: ENV['VAGRANT_INSTANCE_IPADDRESS']

    config.ssh.password = 'laboratory'
    config.ssh.username = 'root'

    config.vm.synced_folder ".", "/vagrant", type: "smb", smb_username: ENV['SMB_USERNAME']
    
    config.vm.provision "shell", path: "vagrant/configure_env.sh"
end

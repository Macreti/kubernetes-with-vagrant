Vagrant.configure("2") do |config|

   config.vm.define "kube-master", autostart: false do |master|
     master.vm.hostname = "master-node"
     master.vm.network "private_network", type: "dhcp"
     master.vm.box = "bento/ubuntu-18.04"

     master.vm.provider "virtualbox" do |v|
       v.memory = 2048
       v.cpus = 2
     end

     master.vm.provision "shell" do |sh|
       sh.path = "install_tools.sh"
     end
   end


  ["one","two"].each do |i|
    config.vm.define "kube-worker-#{i}", autostart: false do |worker|
      worker.vm.hostname = "worker-node-#{i}"
      worker.vm.network "private_network", type: "dhcp"
      worker.vm.box = "bento/ubuntu-18.04"
	
      worker.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 1
      end	
	
      worker.vm.provision "shell" do |sh|
        sh.path = "install_tools.sh"
      end
    end
  end
end

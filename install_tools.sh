#!/bin/sh

#Install nginx
#sudo apt-get update
#sudo apt-get -y install nginx 
#sudo systemctl enable nginx
#sudo systemctl start nginx
#sudo nginx -t

#Install docker
sudo apt-get -y update
sudo apt-get install ca-certificates curl gnupg lsb-release
echo "install certificates succesfully"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "Download gpg successfully"

echo "Begin docker install"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
echo "End docker install"

#sudo apt-get -y install linux-headers-$(uname -r)
#sudo apt-get -y install virtualbox
#curl -Lo kubectl http://storage.googleapis.com/kubernetes-release/release/v1.3.6/bin/linux/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/
#curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.8.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

echo "Begin install kubernetes"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-get -y install curl
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get -y install kubeadm kubelet kubectl
sudo apt-mark hold kubeadm kubelet kubectl
echo "End install kubernetes"
#sudo usermod -aG docker $USER
#sudo reboot


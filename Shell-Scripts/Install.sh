#Trivy installation and also add the trivy repo
rpm -ivh https://github.com/aquasecurity/trivy/releases/download/v0.47.0/trivy_0.47.0_Linux-64bit.rpm
export PATH=$PATH:/usr/local/bin/
source ~/.bashrc
yum update -y
pip3 install json2html
rpm --import https://packages.microsoft.com/keys/microsoft.asc
dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm
dnf install azure-cli -y
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y
pip3 install ansible 
export PATH=$PATH:/usr/local/bin
source ~/.bashrc
echo 'Installations are complete.. '
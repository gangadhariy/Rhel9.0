yum remove trivy -y
yum remove azure-cli -y
pip3 uninstall -y json2html
rm -f /etc/yum.repos.d/*
rm -rf /tmp/*
yum clean all -y
yum autoremove -y
echo 'removed all installed packages and files'
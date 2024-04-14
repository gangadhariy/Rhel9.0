export PATH=$PATH:/usr/local/bin
source ~/.bashrc
ansible-playbook --become-password-file /tmp/pass.txt /tmp/RHEL-CIS.yml -vvvv

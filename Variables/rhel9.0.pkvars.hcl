boot_command=["<tab><tab><tab><tab>c<wait>","<tab><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "linux /images/pxeboot/vmlinuz ksdevice=link inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter>",
    "initrd /images/pxeboot/initrd.img<enter>",
    "boot<enter>"]
disk_additional_size=["150000"]
disk_size="70000"
http_directory="http"
iso_checksum_type="sha256"
iso_checksum="C6942E3ED65947ED48C30589D9C1A752E96C5B94EE8DE1923331449FEE162CC1"
iso_url = "file://G:/C-Documents/packer/rhel9.2/rhel-baseos-9.0-x86_64-dvd.iso"
output_directory="output-rhel-9.0"
ssh_password="rhel"
ssh_username="rhel"
switch_name="packer-hyperv-iso"
vlan_id=""
vm_name="cicd-rhel-g2"

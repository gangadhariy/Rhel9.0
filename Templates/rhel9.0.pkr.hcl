variable "boot_command" {
}

variable "disk_size" {
  type    = string
  default = "70000"
}

variable "disk_additional_size" {
  type    = list(number)
  default = ["1024"]
}

variable "memory" {
  type    = string
  default = "1024"
}

variable "cpus" {
  type    = string
  default = "1"
}

variable "iso_checksum" {
  type    = string
  default = ""
}

variable "iso_checksum_type" {
  type    = string
  default = "none"
}

variable "iso_url" {
  type    = string
  default = ""
}

variable "output_directory" {
  type    = string
  default = ""
}


variable "ssh_password" {
  type    = string
  default = ""
  sensitive = true
}

variable "switch_name" {
  type    = string
  default = ""
}


variable "vlan_id" {
  type    = string
  default = ""
}

variable "vm_name" {
  type    = string
  default = ""
}

variable "http_directory" {
  type    = string
  default = ""
}

variable "ssh_username" {
  type    = string
  default = "rhel"
}

source "hyperv-iso" "vm" {
  boot_command          = "${var.boot_command}"
  boot_wait             = "10s"
  communicator          = "ssh"
  cpus                  = "${var.cpus}"
  disk_block_size       = "1"
  disk_size             = "${var.disk_size}"
  #enable_dynamic_memory = "false"
  enable_secure_boot    = false
  generation            = 2
  guest_additions_mode  = "disable"
  http_directory        = "${var.http_directory}"
  iso_checksum          = "${var.iso_checksum_type}:${var.iso_checksum}"
  iso_url               = "${var.iso_url}"
  memory                = "${var.memory}"
  output_directory      = "${var.output_directory}"
  shutdown_command      = "sudo /sbin/shutdown -hP now"
  shutdown_timeout      = "30m"
  ssh_password          = "${var.ssh_password}"
  ssh_timeout           = "4h"
  ssh_username          = "${var.ssh_username}"
  switch_name           = "${var.switch_name}"
  temp_path             = "."
  vlan_id               = "${var.vlan_id}"
  vm_name               = "${var.vm_name}"
}
build {
  sources = ["source.hyperv-iso.vm"]

  provisioner "file" {
    source = "./Ansible/RHEL-CIS.yml"
    destination = "/tmp/RHEL-CIS.yml"
}
  provisioner "file" {
    source = "./Ansible/pass.txt"
    destination = "/tmp/pass.txt"
}
  
  provisioner "file" {
    source = "./Python-Scripts/Convert.py"
    destination = "/tmp/Convert.py"
}
  
  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script = "./Shell-Scripts/repo.sh"
  }

  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script = "./Shell-Scripts/install.sh"
  }
  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script = "./Shell-Scripts/scan.sh"
  }
  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script = "./Shell-Scripts/Convert.sh"
  }
  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script = "./Shell-Scripts/Upload.sh" 
  }
  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script = "./Ansible/role.sh"
  } 
  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script = "./Ansible/run-playbook.sh"
  } 
  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script = "./Shell-Scripts/Remove.sh"
  } 

}
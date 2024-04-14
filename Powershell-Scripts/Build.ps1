$variables_file = "./Variables/rhel9.0.pkvars.hcl"
$template_file = "./Templates/rhel9.0.pkr.hcl"

packer validate -var-file $variables_file $template_file
packer build -var-file $variables_file $template_file
$rhel9 = "G:/C-Documents/packer/rhel9.2/rhel-baseos-9.0-x86_64-dvd.iso"

if (Test-Path -Path $rhel9 -PathType Leaf) {
    Write-Host "The file exists."
} else {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest https://developers.redhat.com/content-gateway/file/rhel-baseos-9.0-x86_64-dvd.iso -UseBasicParsing  -OutFile "$rhel9"
    Write-Host "rhel-baseos-9.0-x86_64-dvd.iso is Downloaded"
}

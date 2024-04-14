#!/bin/bash

cat <<EOF > /etc/yum.repos.d/baseos.repo
[BaseOS]
name=CentOS-$releasever - Base
#mirrorlist=http://#mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=BaseOS&infra=$infra
baseurl=http://vault.centos.org/centos/8/BaseOS/x86_64/os/
gpgcheck=0
enabled=1
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF

cat <<EOF > /etc/yum.repos.d/appstream.repo
[AppStream]
name=CentOS-$releasever - AppStream
#mirrorlist=http://#mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=AppStream&infra=$infra
baseurl=http://vault.centos.org/centos/8/AppStream/x86_64/os/
gpgcheck=0
enabled=1
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF

cat <<EOF > /etc/yum.repos.d/powershell-tool.repo
[PowerTools]
name=CentOS-$releasever - PowerTools
#mirrorlist=http://#mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=PowerTools&infra=$infra
baseurl=http://vault.centos.org/centos/8/PowerTools/x86_64/os/
gpgcheck=0
enabled=1
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF



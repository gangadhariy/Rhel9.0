trivy filesystem --format=json -o /tmp/rhel_scan.json --timeout 60m --scanners vuln /
echo 'Trivy scan complete.'
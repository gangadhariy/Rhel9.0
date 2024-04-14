$VHDX_path = "C:\Users\administrator.HCITEST\Downloads\agent\_work\cicd-ubuntu2204-g2.vhdx"
$OutputVariable = Get-ChildItem -Path "$VHDX_path" -Recurse | ForEach-Object { $_.FullName } 
rm "$OutputVariable"
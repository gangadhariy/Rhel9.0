import json
from json2html import *

# Update the file path to point to /tmp/trivy_scan.json
file_path = '/tmp/rhel_scan.json'

# Load JSON data from the specified file path
with open(file_path, 'r') as json_file:
    json_data = json.load(json_file)

# Define an HTML template
html_template = """
<!DOCTYPE html>
<html>
<head>
    <title>Trivy Scan Report</title>
</head>
<body>
    <h1>Trivy Scan Report</h1>
    <table border="1">
        {}
    </table>
</body>
</html>
"""

# Convert JSON to HTML table
html_table = json2html.convert(json=json_data)

# Insert the HTML table into the template
complete_html = html_template.format(html_table)

# Save the complete HTML report to a file
with open('/tmp/rhel_scan.html', 'w') as html_file:
    html_file.write(complete_html)

print("Conversion complete. The HTML report is saved as '/tmp/rhel_scan.html'.")
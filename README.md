# Automation - PPT to PDF as service
This script automated frequent converting ppt/pptx to pdfs.
- In the script file, modify folder locations as needed.

## To run the script as service - one of may ways
- Move or create `convert_ppt_to_pdf.sercice` to`/etc/systemd/system/` 
- `sudo systemctl daemon-reload`
- `sudo systemctl start convert_ppt_to_pdf.service` or `enable` depending on you use case.

### Requirements
- soffice "comes with Libreoffice"

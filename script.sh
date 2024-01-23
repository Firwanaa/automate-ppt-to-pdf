#!/bin/bash

ppt_folder="$HOME/Desktop/ppts-in" #modify as needed
pdf_folder="$HOME/Desktop/pdf-out" #modify as needed

# Create PDF folder if it doesn't exist
mkdir -p "$pdf_folder"

inotifywait -m -r -e create --format '%w%f' "$ppt_folder" | while read new_ppt
do
    # Convert to PDF
    soffice --headless --convert-to pdf "$new_ppt" --outdir "$pdf_folder"

    # Extract file names
    file_name=$(basename -- "$new_ppt")
    file_name_noext="${file_name%.*}"
    pdf_file="$pdf_folder/$file_name_noext.pdf"

    # Delete PowerPoint file after conversion
    rm "$new_ppt"

    echo "Converted: $file_name_noext.pptx to $file_name_noext.pdf and deleted $file_name_noext.pptx"
done

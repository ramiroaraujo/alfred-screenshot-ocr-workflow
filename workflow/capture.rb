# captures screen interatively
`/usr/sbin/screencapture -i temp-screenshot.png`

# runs OCR on captured bitmap
`/usr/local/bin/tesseract temp-screenshot.png temp-ocr > /dev/null 2>&1`

# gets OCR text
output = `cat temp-ocr.txt`.strip

# removes temp files
`rm temp-ocr.txt temp-screenshot.png`

print output

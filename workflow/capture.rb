require_relative 'workflow_config'

language_override = ARGV[0] || ''

config = WorkflowConfig.new
languages = language_override == '' ? config.get_current_languages_string : language_override

# captures screen interatively
`/usr/sbin/screencapture -i temp-screenshot.png`

# pre-process captured image to be larger and greyscale for improving tesseract results.
# NOTE: requires ImageMagick is installed via homebrew.
`/usr/local/bin/convert temp-screenshot.png -resize 400% -type Grayscale temp-screenshot.tif`

# runs OCR on captured bitmap
`/usr/local/bin/tesseract -l "#{languages}" temp-screenshot.png temp-ocr > /dev/null 2>&1`

# gets OCR text
output = `cat temp-ocr.txt`.strip

# removes temp files
`rm temp-ocr.txt temp-screenshot.png`

print output


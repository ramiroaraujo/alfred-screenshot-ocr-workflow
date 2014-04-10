# Alfred Screenshot to Text Workflow

> Work in progress, dependencies need to be installed

A handy workflow to convert parts of the screen to text, performing OCR on the captured image.

The workflow is triggered by a shortcut or keyword, prompts the user to capture an area of the screen using the built-in
screencapture app from OS X, and then performs an OCR on the resulting image and sets the result to the clipboard.

The workflow uses the [Tesseract OCR](https://code.google.com/p/tesseract-ocr/) open source library to perform the actual OCR. Saddily, I still don't know how to bundle all the runtime dependencies together to ship with the workflow, so it currently _only_ works if you have the tesseract application already installed in you system. You can install with homebrew: ```brew install tesseract --all-languages```


## Usage

Trigger the workflow with the registered shortcut (default is ```⌘+⌃+⇧+o```) or the keyword ```screentotext```, and you'll see the default cross icon from OS X screencapture app. Capture the desired region and the OCRed text will be placed back to the clipboard.

![capture](https://raw.githubusercontent.com/ramiroaraujo/alfred-screenshot-to-text-workflow/master/screenshots/capture.gif)

You can use the keyword trigger to override the default language config and make a capture with a different language. Say you have English config, but you're browsing a Spanish webpage and want to capture some text; you don't want to change the config to spanish, you'll just use it this time. You do this by selecting an alternative language on the options displayed, you can filter options by typing the desired language name.

![config](https://raw.githubusercontent.com/ramiroaraujo/alfred-screenshot-to-text-workflow/master/screenshots/config.gif)


## Installation

For OS X 10.9 Mavericks, Download the [alfred-screenshot-to-text.alfredworkflow](https://github.com/ramiroaraujo/alfred-screenshot-to-text-workflow/raw/master/alfred-screenshot-to-text.alfredworkflow) and import to Alfred 2.

As said previously, I couldn't find a proper way of bundling the Tesseract binary and dependencies to pack them all in the workflow, so you need to have installed Tesseract, preferabily with all the languages, unless only using english.

To install Tesseract, run ```brew install tesseract --all-languages```, remove the ```--all-languages``` if you only need english.


## Configuration

You can select the default language or languages from the workflow config. Run the config with the keyword ```configscreentotext``` and you'll see the first result showing the current languages, and a list of available languages to add or remove; they work as a toggle, so I you have one, actioning over it will remove it, and if you don't, it will add it. You can also filter the options by typing the desired language name.

Please keep in mind this is the default Tesseract languages list from the Homebrew install with all the languages, _it's not_ reading the available languages form your system. Optionally you can simply remove the config option from the workflow if you're only using English.

## Changelog

* _2014-04-09_ - Released

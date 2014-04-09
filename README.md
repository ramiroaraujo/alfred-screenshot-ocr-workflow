# Alfred Screenshot to Text Workflow

> Work in progress

A handy workflow to convert parts of the screen to text, performing OCR on the captured image.

The workflow is triggered by a shortcut or keyword, prompts the user to capture an area of the screen using the built-in
screencapture app from OS X, and then performs an OCR on the resulting and sets the result to the clipboard.

The workflow uses the [Tesseract OCR](https://code.google.com/p/tesseract-ocr/) open source library to perform the actual OCR. Saddily, I still don't know how to bundle all the runtime dependencies together to ship with the workflow, so it currently _only_ works if you have the tesseract application already installed in you system. You can installing with homebrew: ```brew install tesseract```

## Usage

Trigger the workflow with the registered shortcut (default is ```⌘+⌃+⇧+3```) or the keyword ```screentotext```, and you'll see the default cross icon from OS X screencapture app. Capture the desired region and the OCRed text will be placed back to the clipboard.

![capturescreen](https://raw.github.com/ramiroaraujo/alfred-screencapture-enhancer-workflow/master/screenshots/capturescreen.png)

* ```⌘+⇧+4``` to take an area screen capture interactively, or write the keyword ```capture``` and optionally specify a filename.
* ```⌘+⌃+⇧+4``` to save an area screen capture interactively to the clipboard, or write the keyword ```capture``` and action it while holding control.

![capture](https://raw.github.com/ramiroaraujo/alfred-screencapture-enhancer-workflow/master/screenshots/capture.png)

* ```⌘+⇧+⌥+4``` to take a screen capture of the previously used area, or write the keyword ```capturelast``` and optionally specify a filename.
* ```⌘+⇧+⌥+⌃+4``` to save a screen capture of the previously used area to the clipboard, or write the keyword ```capturelast``` and action it while holding control.

![capturelast](https://raw.github.com/ramiroaraujo/alfred-screencapture-enhancer-workflow/master/screenshots/capturelast.png)

As shown in all examples, the keyword version is capable of specifying a name for the captured image.

## Installation

For OS X 10.9 Mavericks, Download the [alfred-screencapture-enhancer.alfredworkflow](https://github.com/ramiroaraujo/alfred-screencapture-enhancer-workflow/raw/master/alfred-screencapture-enhancer.alfredworkflow) and import to Alfred 2.

For Previous OS X Versions, Download the [alfred-screencapture-enhancer.alfredworkflow](https://github.com/ramiroaraujo/alfred-screencapture-enhancer-workflow/raw/pre-mavericks/alfred-screencapture-enhancer.alfredworkflow) and import to Alfred 2.

_First_, go to ```System Preferences -> Keyboard```, there to the ```Shortcuts``` tab, select ```Screenshots``` in the left list and uncheck all the shortcuts on the right, as shown below.

![preferences](https://raw.github.com/ramiroaraujo/alfred-screencapture-enhancer-workflow/master/screenshots/preferences.png)

Then install the workflow and fill the 6 shortcuts with the desired key-combos. The workflow is imported without key combos. It should look like this:

![no-shortcuts](https://raw.github.com/ramiroaraujo/alfred-screencapture-enhancer-workflow/master/screenshots/no-shortcuts.png)

This are the recommended key-combos, the same ones disabled earlier, plus two new ones:

1. ```⌘+⇧+4```, to capture an area
2. ```⌘+⌃+⇧+4```, to capture an area to the clipboard
3. ```⌘+⇧+⌥+4```, to capture the last area
4. ```⌘+⇧+⌥+⌃+4```, to capture the last area to the clipboard
5. ```⌘+⇧+3```, to capture the full screen
6. ```⌘+⌃+⇧+3```, to capture the full screen to the clipboard

After configuring the shortcuts it should look like this:

![shortcuts](https://raw.github.com/ramiroaraujo/alfred-screencapture-enhancer-workflow/master/screenshots/shortcuts.png)


## Configuration

You can configure the _image format_, _base name_, _location_ and _drop shadow_ (in window mode) within the workflow. This procedure is done manually by opening the workflow folder and editing the ```config.yml``` file, the options are self explanatory, but please save a backup of the file before changing it.

In the future I'll implement the configuration within the workflow.

## Changelog

* _2014-04-08_ - Released

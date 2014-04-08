# Alfred Workflow Ruby Template

A template for Ruby-based Alfred 2 workflow development. This project was originally a fork of Zhao Cai's (https://github.com/zhaocai/alfred2-ruby-template) but eventually the differences grew a little bigger, plus it has specific ruby dependencies that made my life easier and make it possible to develop for both OS X Mavericks and also previous versions (which have Ruby 1.8 as default system ruby).

## Features:

* Use standard [bundler][gembundler] to easily package, manage, and update ruby gems in the workflow.
* Uses **rbenv** to manage ruby versions in project, easily switching between Ruby 2.0 (Mavericks) and Ruby 1.8 (pre Mavericks)
* Friendly exception and debug output to the Mac OS X Console
* Automate rescue feedback items to alfred when something goes wrong.
* Automate saving and loading cached feedback
* Configure basic workflow info directly in the config.yml file and have it updated in the workflow's plist file.
* Export your Workflow directly through a rake task.

> Alfred workflow and feedback related functions are located in a separate [alfred-workflow gem]( https://github.com/zhaocai/alfred-workflow ) which can be easily installed by adding `gem "alfred-workflow"` in the Gemfile.

* Functions to easily load and save user configuration (in YAML)
* Functions for smart case query filter of feedback results.
* Functions for finding the bundle ID, cache and storage paths, and query arguments.
* Functions for reading and writing plist files.
* Functions to simplify generating feedback XML for Alfred.


## Quick Example

```ruby
require_relative "bundle/bundler/setup"
require "alfred"

Alfred.with_friendly_error do |alfred|
  fb = alfred.feedback

  fb.add_file_item(File.expand_path "~/Applications/")

  puts fb.to_xml()
end
```

Main code are wrapped in `Alfred.with_friendly_error` block. Exceptions and debug messages are logged to Console log file **~/Library/Logs/Alfred-Workflow.log**.

One more example with rescue feedback automatically generated!

```ruby
require 'rubygems' unless defined? Gem
require_relative "bundle/bundler/setup"
require "alfred"

def my_code_with_something_goes_wrong
  true
end

Alfred.with_friendly_error do |alfred|
  alfred.with_rescue_feedback = true

  fb = alfred.feedback

  if my_code_with_something_goes_wrong
    raise Alfred::NoBundleIDError, "Wrong Bundle ID Test!"
  end
end
```

![rescue feedback](https://raw.github.com/ramiroaraujo/alfred-ruby-template/master/screenshots/rescue%20feedback.png)


## Requirements

You'll need rbenv to manage multiple ruby versions. RVM could work too, but I had terrible issues with gems and native extensions, issues that were instantly resolved when switched to rbenv. Plus, rbenv's local ruby configuration makes it perfect to specify a ruby 2.0 version for a mavericks branch and a ruby 1.8 version for previous OS branch.

If you're using homebrew, you can easily install rbenv by doing ```brew install rbenv ruby-build```. ruby-build will allow you to build different versions of Ruby. If you need to build Ruby 1.8, keep in mind you'll need other dependencies, such as gcc 4.2.

My approach for developing workflows for Mavericks and pre Mavericks OS is:

```brew install rbenv ruby-build```

```rbenv install 1.8.7-p375``` (latest 1.8 version, check dependencies!)

```gem install plist bundler``` (template requirements, for recently installed 1.8 version)

```rbenv install 2.0.0-p353``` (latest 2.0 version)

```gem install plist bundler``` (template requirements, for recently installed 2.0 version)

then on a new project, create a mavericks branch (or leave it as master branch) and

copy over the master branch template

run ```rbenv local 2.0.0-p353```, and version the created .ruby-version file

then create a new pre-mavericks branch and

copy over the pre-mavericks branch template

run ```rbenv local 1.8.7-p375```

this way you can switch branches and have a working Ruby 1.8 or 2.0 version. I also recomend to version IDE project files, to have run and debug configuration versioned each to it's specific Ruby version, in my case I'm versioning the Intellij IDEA project and module file.


## Quick Start Guide

You may directly download the [alfred-ruby-template workflow]( https://github.com/ramiroaraujo/alfred-ruby-template/raw/master/alfred-ruby-template.alfredworkflow ) here, install, and play with the keywords: `test feedback` and `test rescue feedback`.

### Step 1: Clone or Fork

Clone or fork this repo to your local directory:

`git clone https://github.com/ramiroaraujo/alfred-ruby-template.git`

### Step 2: Config.yml
Update **domain**, **id**, **name**, **description**, **created_by**, **website** and **readme** in the `config.yml` file.

```yaml
## workflow build config

# id and name for the workflow (bundle id = domain.id)
id: alfred-ruby-template

# base domain
domain: com.tumblr.ramiroaraujo

name: Ruby Based Workflow Template
description: A starting place for developing Ruby based workflow in Alfred
created_by: Ramiro Araujo
website: https://github.com/ramiroaraujo/alfred-ruby-template
readme: readme

## development config

# path is the relative path to the workflow in the project root
path: workflow

# If you are using Alfred's advanced Dropbox sync, indicate the path shown in
# Alfred Preferences > Advanced > Syncing:
dropbox: ~/Dropbox
```

### Step 3: Install

Run ```rake bundle:install``` to create the local gems configuration.

Run `rake install` to install the workflow or `rake dbxinstall` if you are using Alfred's advanced Dropbox sync. Now you can see the workflow loaded in the
Alfred workflow interface.

### Step 4: Add Ruby Gems

Edit **workflow/Gemfile**. Add some gems.

```ruby
source "https://rubygems.org"

gem "plist"
gem "alfred-workflow"
# gem "your-gem-required"
```

Run `rake bundle:update` to pull the gems into **workflow/bundle/** folder.

### Step 5: Your Code

Now you are good to add your own code based on the previous example.

### Step 6: Export

When your workflow is ready, run ```rake export``` to create a .alfredworkflow packed file (actually just a zip file) in the root of your project, ready for deployment.


### Optional Step: Swith between Ruby versions

checkout the proper version and run ```rake clobber``` and then ```rake bundle:install``` to install the proper gems for the new version.


## Credits

Although no longer a fork from Zhao Cai's https://github.com/zhaocai/alfred2-ruby-template, it's still heavily influentied by it, both on code and readme file :)


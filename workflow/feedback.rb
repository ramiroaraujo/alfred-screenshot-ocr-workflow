#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require_relative 'bundle/bundler/setup'
require 'alfred'
require_relative 'workflow_config'

query = ARGV[0] || ""
query = query.downcase


Alfred.with_friendly_error do |alfred|

  fb = alfred.feedback
  config = WorkflowConfig.new

  current_languages = config.get_current_languages
  current_languages = current_languages.length > 1 ? "Current languages are #{current_languages[0..-2].join(', ')} and #{current_languages.last}" : "Current language is #{current_languages.first}"
  fb.add_item({
      :title => 'Select an area of the screen to convert to text with default languages',
      :subtitle => current_languages,
      :valid => 'yes',
  })


  # list new ones, filtered
  search = config.search_languages(query)

  if search.length
    search.each do |lang|
      fb.add_item({
          :title => "Interpret text as #{lang[:lang]}",
          :subtitle => '',
          :arg => lang[:key],
          :valid => 'yes',
      })
    end
  else
    fb.add_item({
        :title => 'No results for your search',
        :subtitle => '',
        :valid => 'no',
    })

  end

  puts fb.to_xml()
end

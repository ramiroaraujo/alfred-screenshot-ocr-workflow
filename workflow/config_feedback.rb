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

  # show current languages
  current_languages = config.get_current_languages
  current_languages_message = config.get_current_languages_message
  fb.add_item({
      :title => 'Current languages the OCR looks for',
      :subtitle => current_languages_message,
      :valid => 'no',
  })


  # list new ones, filtered
  search = config.search_languages(query)

  if search.length
    search.each do |lang|
      current = current_languages.include? lang[:key]
      fb.add_item({
          :title => lang[:lang],
          :subtitle => current ? "Remove the #{lang[:lang]} language from current languages" : "Add the #{lang[:lang]} language to current languages",
          :arg => current ? "remove|#{lang[:key]}" : "add|#{lang[:key]}",
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

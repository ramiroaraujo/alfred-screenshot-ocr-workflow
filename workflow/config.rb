#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'workflow_config'

# extract variables
command, key = ARGV[0].split '|'

config = WorkflowConfig.new

case command
  when 'add'
    config.add_current_language key
    print "Language #{key} added"
  when 'remove'
    config.remove_current_language key
    print "Language #{key} removed"
end

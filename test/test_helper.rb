# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

begin
  require 'simplecov'

  excluded_test_paths = [
    'api/lib/container.rb',
    'api/lib/environment.rb',
    'test'
  ]

  SimpleCov.add_filter(excluded_test_paths)
  SimpleCov.minimum_coverage(90)
  SimpleCov.start
rescue LoadError
  puts 'SimpleCov not found'
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/minitest'
require 'pry'
require './api/boot'
require_relative 'test_mixins'

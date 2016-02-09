ENVIRONMENT = ENV['ENV'] || ENV['env'] || 'default'
puts "Running in #{ENVIRONMENT}"

root_path = File.dirname(File.dirname(__FILE__))
ENV['BUNDLE_GEMFILE'] ||= File.join(root_path, 'Gemfile')

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

Bundler.require(ENVIRONMENT)

# Load dependencies

require 'highline'
require 'plist'
require 'git'

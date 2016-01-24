require 'bundler/setup'
ENVIRONMENT = ENV['ENV'] || ENV['env'] || 'default'
Bundler.require(ENVIRONMENT)

cli = HighLine.new
# require 'highline/import'

puts "Running in #{ENVIRONMENT}"

ENVIRONMENT = ENV['ENV'] || ENV['env'] || 'default'
puts "Running in #{ENVIRONMENT}"

current_file_path = File.expand_path($0)
root_path = File.dirname(File.dirname(current_file_path))
ENV['BUNDLE_GEMFILE'] = File.join(root_path, 'Gemfile')

require 'bundler/setup'
Bundler.require(ENVIRONMENT)

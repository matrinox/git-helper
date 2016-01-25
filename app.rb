require 'bundler/setup'
ENVIRONMENT = ENV['ENV'] || ENV['env'] || 'default'
Bundler.require(ENVIRONMENT)

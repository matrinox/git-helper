source 'https://rubygems.org'
ruby '2.3.0'
gemspec name: 'git-helper'

gem 'highline', path: '/Users/matrinox/Developer/highline'
gem 'plist'

gem 'git', path: '/Users/matrinox/Developer/ruby-git'

group :debug do
  # shows queries and call site in our app
  gem 'rubocop'
  gem 'awesome_print'
  gem 'byebug', '~> 8.2.1'
  gem 'pry'
  # Legacy support between byebug and pry
  # https://github.com/deivid-rodriguez/pry-byebug
  gem 'pry-byebug', '~> 3.3.0'
  # Adds ruby syntax colouring to code as you type in the pry REPL
  # https://github.com/pry/pry-coolline
  gem 'pry-coolline', '~> 0.2.5'
  # Gives shortcuts like show-routes, show-models
  # https://github.com/rweng/pry-rails
  gem 'pry-rails', '~> 0.3.4'
  # pry-toys give convenience methods to create fake objects for testing things out in the REPL
  # https://github.com/ariabov/pry-toys/
  gem 'pry-toys', '~> 0.0.2'
  # pry-macro gives tools to easily record macros and save it to pryrc (you can also do it manually)
  # NOTE: This one is a bit buggy as the first command is skipped but just type in 1 after recording
  # https://github.com/baweaver/pry-macro
  gem 'pry-macro', '~> 1.0.1'
  # pry-state shows you state of all local and instance variables
  # https://github.com/SudhagarS/pry-state
  gem 'pry-state', '~> 0.1.7'
  # pry-inline shows values of variables inline, like chrome dev tools
  # https://github.com/seikichi/pry-inline
  gem 'pry-inline', '~> 1.0.1'
end

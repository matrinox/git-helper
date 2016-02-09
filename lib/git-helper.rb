require 'git-helper/version'
require 'bundler_setup'
require 'setup'
require 'git-helper/menus/main'

module GitHelper
  def self.start
    GitHelper::MainMenu.open
  end
end

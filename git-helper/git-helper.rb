current_file_path = File.expand_path($0)

git_helper_path = File.dirname(current_file_path)
unless $LOAD_PATH.include?(git_helper_path)
  $LOAD_PATH.unshift(git_helper_path)
end

root_path = File.dirname(git_helper_path)
unless $LOAD_PATH.include?(root_path)
  $LOAD_PATH.unshift(root_path)
end

def load_folder(folder_name)
  folder_path = File.expand_path(folder_name, 'git-helper')
  unless $LOAD_PATH.include?(folder_path)
    $LOAD_PATH.unshift(folder_path)
  end
end

load_folder('actions')
load_folder('menus')

puts $LOAD_PATH
require 'bundler_setup'
require 'setup'
require 'menus/main'

GitHelper::MainMenu.open

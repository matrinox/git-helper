require "git-helper/version"

current_file_path = File.expand_path($0)

git_helper_path = File.dirname(current_file_path)
unless $LOAD_PATH.include?(git_helper_path)
  $LOAD_PATH.unshift(git_helper_path)
end

root_path = File.dirname(git_helper_path)
unless $LOAD_PATH.include?(root_path)
  $LOAD_PATH.unshift(root_path)
end

lib_path = File.expand_path('git-helper', 'lib')
unless $LOAD_PATH.include?(lib_path)
  $LOAD_PATH.unshift(lib_path)
end

def load_folder(lib_path, folder_name)
  folder_path = File.join(lib_path, folder_name)
  unless $LOAD_PATH.include?(folder_path)
    $LOAD_PATH.unshift(folder_path)
  end
end

load_folder(lib_path, 'actions')
load_folder(lib_path, 'menus')

puts $LOAD_PATH
require 'bundler_setup'
require 'setup'

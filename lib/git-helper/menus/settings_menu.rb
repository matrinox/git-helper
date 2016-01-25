puts $LOAD_PATH
require 'menu'

module GitHelper
  class SettingsMenu < Menu
    def self.open
      cli = HighLine.new
      cli.choose do |menu|
        menu.header = "Settings"
        menu.prompt = "? "
        current_git_root_directory = `pwd`.sub("\n", '/.git-helper-pref.plist')
        # Refactor into user pref manager
        pref = Plist.parse_xml(current_git_root_directory)
        current_main_branch = pref['main']
        menu.choice(:main_branch, text: "Set the <%= color('main branch', BOLD) %> that you base all your topic/feature branches off of (currently #{current_main_branch})") do
          # Move to actions
          answer = cli.ask('What is the main branch (e.g. master, release)?')
          pref = { main: answer }
          Plist::Emit.save_plist(pref, current_git_root_directory)
          cli.say("We've set it to #{answer}")
          open
        end
        menu.choice(:return, text: "<%= color('Return', BOLD) %> back to the main menu") do
          MainMenu.open
        end
      end
    end
  end
end

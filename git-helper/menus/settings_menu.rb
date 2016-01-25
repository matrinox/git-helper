puts $LOAD_PATH
require 'menu'

module GitHelper
  class SettingsMenu < Menu
    def self.open
      cli = HighLine.new
      cli.choose do |menu|
        menu.header = "Settings"
        menu.prompt = "? "
        menu.choice(:main_branch, text: "Set the <%= color('main branch', BOLD) %> that you base all your topic/feature branches off of") do
          answer = cli.ask('What is the main branch (e.g. master, release)?')
          hash = {main: answer}
          hash.to_plist
          cli.say(`pwd`)
          # Plist::Emit.save_plist(hash, )
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

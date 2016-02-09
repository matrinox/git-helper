require 'git-helper/menus/menu'
require 'git-helper/menus/main'
require 'git-helper/actions/settings/main_branch_action'

module GitHelper
  class SettingsMenu < Menu
    include Settings

    def self.open
      cli = HighLine.new
      cli.choose do |menu|
        menu.header = "Settings"
        menu.prompt = "? "
        current_main_branch = GitHelper.settings_for(:main)
        menu.choice('main_branch', text: "Set the <%= color('main branch', BOLD) %> that you base all your topic/feature branches off of (currently #{current_main_branch})") do
          # Move to actions
          MainBranchAction.run
          open
        end
        menu.choice('return', text: "<%= color('Return', BOLD) %> back to the main menu") do
          MainMenu.open
        end
      end
    end
  end
end

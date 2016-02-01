require 'git-helper/menus/menu'
require 'git-helper/menus/main'

module GitHelper
  class BranchCheckoutMenu < Menu
    def self.open
      cli = HighLine.new
      cli.choose do |menu|
        menu.header = "Find the branch using a variety of search types"
        menu.choice('ticket_number', text: "By Pivotal Tracker <%= color('Ticket Number', BOLD) %>") do
          cli.ask('Is this the branch?')
        end
        menu.choice('message', text: "By commit <%= color('message', BOLD) %>") do
          cli.ask('Is this the branch?')
        end
        menu.choice('sha', text: "By commit <%= color('SHA', BOLD) %>") do
          cli.ask('Is this the branch?')
        end
        menu.choice('code', text: "By <%= color('code', BOLD) %> changes") do
          cli.ask('Is this the branch?')
        end
        menu.choice('return', text: "<%= color('Return', BOLD) %> back to the main menu") do
          MainMenu.open
        end
        menu.prompt = "Search by? "
      end
    end
  end
end

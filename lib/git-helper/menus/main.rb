require 'menu'
require 'settings_menu'

module GitHelper
  class MainMenu < Menu
    def self.open
      cli = HighLine.new
      cli.choose do |menu|
        menu.header = "Welcome to Git Helper.\nYour poor skills in Git have led you to this: using a ruby script and punching in numbers to do the work for you. You could've picked up a book on git or learned how to write bash scripts but noooo!\nSigh.\nFirst world problems…\n\nHere are your options"
        menu.prompt = "What do you want to do? "
        menu.choice(:feature, text: "Create a <%= color('feature', BOLD) %> branch", color: 'BLUE')
        menu.choice(:rebase, text: "<%= color('Rebase', BOLD) %> this with master (and keep any working changes)", color: "'choice'") do

        end
        menu.choice(:repair, text: "<%= color('Repair', BOLD) %> this branch. If you are finding that rebasing on this branch has way too many conflicts, use this option to repair it", color: 'YELLOW') do
          cli.say('Stashing your changes…')
          cli.say("I noticed that you have multiple (#{nubmer_of_duplicates} commits with the same name. Please tell me what branch")
        end
        menu.choice(:copy_over, text: "<%= color('Copy over', BOLD) %> changes over from another branch to this branch", color: 'YELLOW')
        menu.choice(:notify_tracker, text: "<%= color('Notify', BOLD) %> Pivotal <%= color('Tracker', BOLD) %> that this ticket is complete", color: 'RED') do
          cli.ask("I have determined that the ticket number is #{ticket_number}. Is this correct?")
          cli.ask('I could not determine the ticket number based on your branch. Please enter it here')
        end
        menu.choice(:create_pr, text: "<%= color('Create', BOLD) %> a <%= color('PR', BOLD) %> (w/ Pivotal Tracker notification options)", color: 'RED') do
          cli.ask("I noticed there is no [Finished/Fixes ##{ticket_number}] commit. Would you like me to create one for you?")
          cli.ask('')
        end
        menu.choice(:settings, text: "Edit <%= color('settings', BOLD) %>", color: 'MAGENTA') do
          SettingsMenu.open
        end
      end
    end
  end
end

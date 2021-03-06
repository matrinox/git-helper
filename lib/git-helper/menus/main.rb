require 'git-helper/menus/menu'
require 'git-helper/menus/settings_menu'
require 'git-helper/menus/branch_checkout_menu'
require 'git-helper/data/sign_offs'

module GitHelper
  module Menus
    class MainMenu < Menu
      def self.open
        cli = HighLine.new
        cli.choose do |menu|
          menu.header = "Welcome to Git Helper.\nYour poor skills in Git have led you to this: using a ruby script and punching in numbers to do the work for you. You could've picked up a book on git or learned how to write bash scripts but noooo!\nSigh.\nFirst world problems…\n\nHere are your options"
          menu.prompt = "What do you want to do? "
          menu.choice('go to', text: "<%= color('Go to', BOLD) %> branch based on variety of factors", color: "BLUE") do
            BranchCheckoutMenu.open
          end
          menu.choice('feature', text: "Create a <%= color('feature', BOLD) %> branch", color: 'BLUE')
          menu.choice('rebase', text: "<%= color('Rebase', BOLD) %> this with master (and keep any working changes)", color: "'choice'") do

          end
          menu.choice('repair', text: "<%= color('Repair', BOLD) %> this branch. If you are finding that rebasing on this branch has way too many conflicts, use this option to repair it", color: 'YELLOW') do
            cli.say('Stashing your changes…')
            cli.say("I noticed that you have multiple (#{nubmer_of_duplicates} commits with the same name. Please tell me what branch")
          end
          menu.choice('copy over', text: "<%= color('Copy over', BOLD) %> changes over from another branch to this branch", color: 'YELLOW')
          menu.choice('notify tracker', text: "<%= color('Notify', BOLD) %> Pivotal <%= color('Tracker', BOLD) %> that this ticket is complete", color: 'RED') do
            cli.ask("I have determined that the ticket number is #{ticket_number}. Is this correct?")
            cli.ask('I could not determine the ticket number based on your branch. Please enter it here')
          end
          menu.choice('create_pr', text: "<%= color('Create', BOLD) %> a <%= color('PR', BOLD) %> (w/ Pivotal Tracker notification options)", color: 'RED') do
            cli.ask("I noticed there is no [Finished/Fixes ##{ticket_number}] commit. Would you like me to create one for you?")
            cli.ask('')
          end
          menu.choice('settings', text: "Edit <%= color('settings', BOLD) %>", color: 'MAGENTA') do
            SettingsMenu.open
          end
          menu.choice('exit', text: "<%= color('Exit', BOLD) %> this program") do
            random_sign_offs = SIGN_OFFS
            country = random_sign_offs.keys.sample
            random_sign_off = random_sign_offs[country].sample
            cli.say("\n\nAs they say in #{country}")
            cli.say(random_sign_off)
          end
        end
      end
    end
  end
end

require 'git-helper/actions/action'

module GitHelper
  module Actions
    module Settings
      class MainBranchAction < Action
        def self.run
          cli = HighLine.new
          answer = cli.ask('What is the main branch (e.g. master, release)?')
          GitHelper.update_settings(:main, answer)
          cli.say("We've set it to #{answer}")
        end
      end
    end
  end
end

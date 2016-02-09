# Action is a very simple interface, exactly like a ruby service except it's .run  instead of .call
# Like ruby services, .run can take any arguments or none at all
#
# Try not to require any dependency or call any code that is in gems
# Stay as low-level as possible, pure ruby, so that it is portable

module GitHelper
  class Action
    def self.run
      fail 'Must implement .run to perform actions'
    end
  end
end

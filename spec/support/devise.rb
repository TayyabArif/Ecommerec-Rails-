require_relative './controller_macros'

RSpec.configure do |config|
     config.include Devise::Test::ControllerHelpers, :type => :controller
    #  config.include Devise::TestHelpers, :type => :controller
    # config.include Devise::Test::ControllerHelpers, :type => :request
    # config.include Devise::TestHelpers, :type => :request
    # config.extend ControllerMacros, :type => :controller
end
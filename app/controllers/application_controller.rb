class ApplicationController < ActionController::API
    #  before_action :authenticate_user!
      after_action :set_response_headers
    # before_action :current_cart

    respond_to :json


    def set_response_headers
        response.headers['Access-Control-Allow-Origin'] = '*'
    end
   
end

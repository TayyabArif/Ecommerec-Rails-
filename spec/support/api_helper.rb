# module ApiHelper
#     def authenticated_header(request, user)
#       auth_headers = Devise::JWT::TestHelpers.auth_headers({}, user)
#     #   request.headers.merge!(auth_headers)
#     end
#   end
# frozen_string_literal: true

module ApiHelpers
  def json_body
    JSON.parse(response.body)
  end

  def confirm_and_login_user(user)
    get '/users/confirmation', params: {token: user.confirmation_token}
    # post '/users/sign_in', params: {user: {email: user.email, password: 'password'}}
    return json_body['auth_token']
  end
end

RSpec.configure do |config|
  config.include ApiHelpers, type: :request
end

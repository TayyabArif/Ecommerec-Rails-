require 'rails_helper'
RSpec.describe "Create product", :type => :request do
  let!(:user) {create(:user, password: 'password')}
  # let!(:category) {create(:category)}
  # let!(:product) {create(:product)}
  # let!(:params) do 
  #     {title: product.title, description: product.description, price: product.price, category_id: category}
  #   end
  # describe "post # product" do
  # login_user
  # it "returns created status after created product" do
  #     byebug
  #     headers = {'ACCEPT' => 'application/json'}
  #     post '/products', :params => params, :headers => headers
  #     expect(response).to have_http_status(201)
  # end

  # include ApiHelper
  describe 'GET # Request it with authenticated requests' do
    # before do
    #   # authenticated_header(request, user)
    #   # get :index
    # end
    # byebug
    it 'Response should be 200' do
    #  logged_in_user = confirm_and_login_user(user)
      # get '/users/confirmation', params: {token: user.confirmation_token}
      # user.update!(confirmed_at: Time.now)
      # byebug
      g = post '/users/sign_in', params: {"user": {"email": "tayyablefty28@gmail.com", "password": "Tayyab01"}}
      byebug
     headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json'}
        auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
        # request.headers.merge!(auth_headers)
        byebug
      #request.headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyNCIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY2MjQ1MjIwMCwiZXhwIjoxNjYyNDU1ODAwLCJqdGkiOiJiNzI0YzI2Yi00NzViLTRiNDUtOTgxMS1iMjZjNmQwNDA5ZGIifQ.s_H9CvK4Czhbo7Zs-vMXq_JuABY9j21p0aq20VJOCsU"
      get '/products', :headers =>  auth_headers
      expect(response).to have_http_status(200)
    end
  end
end
require 'rails_helper'
RSpec.describe ProductsController, :type => :controller do
  let!(:user) {create(:user)}
  # let!(:category) {create(:category)}
  # let!(:product) {create(:product)}
  # let!(:params) do 
  #   {title: product.title, description: product.description, price: product.price, category_id: category}
  # end
  # include ApiHelper
  # describe "POST/" do
  #     it "returns created status after created product" do
  #     logged_in_user = login_user(user)
  #     # headers = {'ACCEPT' => 'application/json'}
  #     # post :create , :params => params
  #     byebug
  #     # request.headers["Authorization"] = logged_in_user[1]
  #     authenticated_header(request, logged_in_user)
  #     get :index
  #     expect(response).to have_http_status(:ok)
  # end
  # end
  include ApiHelper
  context 'Index' do
    context 'Request it with authenticated requests' do
      before do
        # authenticated_header(request, user)
        # get :index
      end
      # byebug
      it 'Response should be 200' do
        headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json'}
        auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
        # request.headers.merge!(auth_headers)
        
        #request.headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyNCIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY2MjQ1MjIwMCwiZXhwIjoxNjYyNDU1ODAwLCJqdGkiOiJiNzI0YzI2Yi00NzViLTRiNDUtOTgxMS1iMjZjNmQwNDA5ZGIifQ.s_H9CvK4Czhbo7Zs-vMXq_JuABY9j21p0aq20VJOCsU"
        byebug
        get :index
        expect(response.status).to eq(200)
      end
    end
  end
  end
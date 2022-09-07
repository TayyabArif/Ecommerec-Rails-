require 'rails_helper'

RSpec.describe "Create Users", :type => :request do
   let!(:user) {create(:user)}
  # before(:all) do
  #   @user1 = create(:user)
  # end
  describe "User" do
    let!(:params) do 
      {user:{email: "asasas@gmail.com", password: user.password, name: user.name, surname: user.surname}}
    end
    it "returns created status after created user" do
        headers = {'ACCEPT' => 'application/json'}
        byebug
        post '/users', :params => params, :headers => headers
        expect(response).to have_http_status(200)
    end
    end
  end
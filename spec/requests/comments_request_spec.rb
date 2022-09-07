require 'rails_helper'

RSpec.describe "Comments", :type => :request do
    let!(:user) {create(:user)}
    # let!(:comment){create(:comment, user: user)}
    describe "post # comments" do
    it "returns created status after created comment" do
        headers = {'ACCEPT' => 'application/json'}
        post '/comments', :params => {:comment => {title: "asassa", product_id: 130}}, :headers => headers
        expect(response).to have_http_status(201)
    end
    end
    describe "get # product" do
    it "returns created status after created product" do
        headers = {'ACCEPT' => 'application/json'}
        get '/comments', :headers => headers
        expect(response).to have_http_status(204)
    end
    end
  end
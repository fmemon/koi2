require 'spec_helper'

describe LinksController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'search'" do
    it "returns http success" do
      get 'search'
      response.should be_success
    end
  end

  describe "GET 'downvote'" do
    it "returns http success" do
      get 'downvote'
      response.should be_success
    end
  end

  describe "GET 'upvote'" do
    it "returns http success" do
      get 'upvote'
      response.should be_success
    end
  end

  describe "GET 'talked_about'" do
    it "returns http success" do
      get 'talked_about'
      response.should be_success
    end
  end

  describe "GET 'latest'" do
    it "returns http success" do
      get 'latest'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end

require "rails_helper"

RSpec.describe PageRequestsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/page_requests").to route_to("page_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/page_requests/new").to route_to("page_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/page_requests/1").to route_to("page_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/page_requests/1/edit").to route_to("page_requests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/page_requests").to route_to("page_requests#create")
    end

    it "routes to #update" do
      expect(:put => "/page_requests/1").to route_to("page_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/page_requests/1").to route_to("page_requests#destroy", :id => "1")
    end

  end
end

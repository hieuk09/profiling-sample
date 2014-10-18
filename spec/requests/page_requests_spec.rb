require 'rails_helper'

RSpec.describe "PageRequests", :type => :request do
  describe "GET /page_requests" do
    it "works! (now write some real specs)" do
      get page_requests_path
      expect(response).to have_http_status(200)
    end
  end
end

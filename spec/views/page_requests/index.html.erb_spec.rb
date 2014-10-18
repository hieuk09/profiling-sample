require 'rails_helper'

RSpec.describe "page_requests/index", :type => :view do
  before(:each) do
    assign(:page_requests, [
      PageRequest.create!(
        :path => "Path",
        :view_duration => 1.5,
        :db_duration => 1.5,
        :page_duration => 1.5
      ),
      PageRequest.create!(
        :path => "Path",
        :view_duration => 1.5,
        :db_duration => 1.5,
        :page_duration => 1.5
      )
    ])
  end

  it "renders a list of page_requests" do
    render
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end

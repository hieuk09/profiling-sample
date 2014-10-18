require 'rails_helper'

RSpec.describe "page_requests/edit", :type => :view do
  before(:each) do
    @page_request = assign(:page_request, PageRequest.create!(
      :path => "MyString",
      :view_duration => 1.5,
      :db_duration => 1.5,
      :page_duration => 1.5
    ))
  end

  it "renders the edit page_request form" do
    render

    assert_select "form[action=?][method=?]", page_request_path(@page_request), "post" do

      assert_select "input#page_request_path[name=?]", "page_request[path]"

      assert_select "input#page_request_view_duration[name=?]", "page_request[view_duration]"

      assert_select "input#page_request_db_duration[name=?]", "page_request[db_duration]"

      assert_select "input#page_request_page_duration[name=?]", "page_request[page_duration]"
    end
  end
end

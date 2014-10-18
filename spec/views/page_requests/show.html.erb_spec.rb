require 'rails_helper'

RSpec.describe "page_requests/show", :type => :view do
  before(:each) do
    @page_request = assign(:page_request, PageRequest.create!(
      :path => "Path",
      :view_duration => 1.5,
      :db_duration => 1.5,
      :page_duration => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Path/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end

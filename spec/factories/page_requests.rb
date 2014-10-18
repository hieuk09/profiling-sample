# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page_request do
    path "MyString"
    view_duration 1.5
    db_duration 1.5
    page_duration 1.5
  end
end

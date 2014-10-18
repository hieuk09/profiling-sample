json.array!(@page_requests) do |page_request|
  json.extract! page_request, :id, :path, :view_duration, :db_duration, :page_duration
  json.url page_request_url(page_request, format: :json)
end

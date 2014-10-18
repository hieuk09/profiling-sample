json.array!(@books) do |book|
  json.extract! book, :id, :name, :description, :author, :publisher
  json.url book_url(book, format: :json)
end

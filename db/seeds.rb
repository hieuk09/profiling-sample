module SeedHelper
  def self.name(model_name, index)
    "#{model_name} name #{index}"
  end

  def self.category_name(index)
    name('category', index)
  end

  def self.book_name(index)
    name('book', index)
  end

  def self.author_name(index)
    name('author', index)
  end

  def self.user_name(index)
    name('user', index)
  end

  def self.random_record(model)
    index = rand(10)
    record_name = name(model.name.underscore, index)
    model.where(name: record_name).first
  end
end

10.times.each do |index|
  name = SeedHelper.category_name(index)
  Category.where(name: name).first_or_create
end

10.times.each do |index|
  name = SeedHelper.author_name(index)
  Author.where(name: name).first_or_create
end

10.times.each do |index|
  name = SeedHelper.user_name(index)
  User.where(name: name).first_or_create
end

10000.times.each do |index|
  category = SeedHelper.random_record(Category)
  user = SeedHelper.random_record(User)
  author = SeedHelper.random_record(Author)
  book_name = SeedHelper.book_name(index)
  book = Book.where(name: book_name, category: category, author: author).first_or_create
  BookUser.where(book: book, user: user).first_or_create
end


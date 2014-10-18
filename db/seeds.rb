# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

module SeedHelper
  def self.category_name(index)
    "name #{index}"
  end

  def self.book_name(index)
    "book name #{index}"
  end
end

10.times.each do |index|
  name = SeedHelper.category_name(index)
  Category.where(name: name).first_or_create
end

10000.times.each do |index|
  category_index = rand(10)
  category_name = SeedHelper.category_name(category_index)
  category = Category.where(name: category_name).first
  book_name = SeedHelper.book_name(index)
  Book.where(name: book_name, category: category).first_or_create
end


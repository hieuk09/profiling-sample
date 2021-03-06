class User < ActiveRecord::Base
  has_many :book_users
  has_many :books, through: :book_users
  has_many :authors, -> { uniq }, through: :books
end

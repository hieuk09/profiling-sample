class AddAuthorToBook < ActiveRecord::Migration
  def change
    remove_column :books, :author
    add_reference :books, :author, index: true, foreign_key: true
  end
end

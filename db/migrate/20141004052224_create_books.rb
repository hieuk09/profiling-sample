class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.string :author
      t.string :publisher

      t.timestamps
    end
  end
end

class CreateUserBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_books do |t|
      t.string :name
      t.string :condition
      t.text :description
      t.integer :price
      t.belongs_to :user, foreign_key: true
      t.belongs_to :book, foreign_key: true

      t.timestamps
    end
  end
end

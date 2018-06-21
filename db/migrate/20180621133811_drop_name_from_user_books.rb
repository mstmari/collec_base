class DropNameFromUserBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_books, :name

  end
end

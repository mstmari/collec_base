class ChangeBackDataTypeUserBook < ActiveRecord::Migration[5.2]
  def change
    change_column :user_books, :user_id, :integer
  end
end

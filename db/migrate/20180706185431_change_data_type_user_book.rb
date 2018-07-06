class ChangeDataTypeUserBook < ActiveRecord::Migration[5.2]
  def change
    change_column :user_books, :user_id, :string
  end
end

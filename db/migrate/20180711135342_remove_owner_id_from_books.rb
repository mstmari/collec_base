class RemoveOwnerIdFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :owner_id

  end
end

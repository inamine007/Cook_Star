class RemoveAdminUserIdFromGroup < ActiveRecord::Migration[6.0]
  def up
    remove_column :groups, :admin_user_id, :integer
  end

  def down
    add_column :groups, :admin_user_id, :integer
  end
end

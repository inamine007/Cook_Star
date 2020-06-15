class ChangeColumnToGroupUsers < ActiveRecord::Migration[6.0]
  def up
    drop_table :group_users
  end
end

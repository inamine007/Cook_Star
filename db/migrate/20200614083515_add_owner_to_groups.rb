class AddOwnerToGroups < ActiveRecord::Migration[6.0]
  def up
    add_column :groups, :owner_id, :integer, null: false
  end

  def down
    remove_column :groups, :owner_id, :integer, null: false
  end
end

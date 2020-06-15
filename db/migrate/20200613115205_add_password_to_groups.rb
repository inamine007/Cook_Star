class AddPasswordToGroups < ActiveRecord::Migration[6.0]
  def up
    add_column :groups, :password, :integer, null: false
  end

  def down
    remove_column :groups, :password, :integer, null: false
  end
end

class AddGroupIdToRecipes < ActiveRecord::Migration[6.0]
  def up
    add_reference :recipes, :group, foreign_key: true
  end

  def down
    remove_reference :recipes, :group, foreign_key: true
  end
end

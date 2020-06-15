class CreateGroupMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_members do |t|
      t.references :user, foreign_key: { on_delete: :cascade }, index: true
      t.references :group, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end

class AddSkillSetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :skill_set, :integer
  end
end

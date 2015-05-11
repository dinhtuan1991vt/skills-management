class CreateSkillCategories < ActiveRecord::Migration
  def change
    create_table :skill_categories do |t|
      t.string :name
      t.integer :parent_id
    end
  end
end

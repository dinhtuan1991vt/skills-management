class AddSkillCategoryRefToSkills < ActiveRecord::Migration
  def change
    add_reference :skills, :skill_category, index: true, foreign_key: true
  end
end

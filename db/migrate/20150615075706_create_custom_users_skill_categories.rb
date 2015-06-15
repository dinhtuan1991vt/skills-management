class CreateCustomUsersSkillCategories < ActiveRecord::Migration
  def change
    create_table :custom_users_skill_categories, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :skill_category, index: true
    end
  end
end

class CreateUsersSkills < ActiveRecord::Migration
  def change
    create_table :users_skills, id: false do |t|
      t.references :user, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
    end
  end
end

class CreateTeamsSkills < ActiveRecord::Migration
  def change
    create_table :teams_skills, id: false do |t|
      t.references :team, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
    end
  end
end

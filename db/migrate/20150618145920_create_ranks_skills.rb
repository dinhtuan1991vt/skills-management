class CreateRanksSkills < ActiveRecord::Migration
  def change
    create_table :ranks_skills, id: false do |t|
      t.references :rank, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
    end
  end
end

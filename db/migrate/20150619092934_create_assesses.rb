class CreateAssesses < ActiveRecord::Migration
  def change
    create_table :assesses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
      t.integer :score
      t.references :supervisor, index: true

      t.timestamps null: false
    end
  end
end

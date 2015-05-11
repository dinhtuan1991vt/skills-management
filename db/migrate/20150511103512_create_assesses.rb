class CreateAssesses < ActiveRecord::Migration
  def change
    create_table :assesses do |t|
      t.integer :skill_id
      t.integer :score
      t.integer :user_id
      t.integer :supervisor_id
    end

    add_index :assesses, :skill_id
    add_index :assesses, :user_id
  end
end

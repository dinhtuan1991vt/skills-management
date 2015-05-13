class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :name
      t.string :status
      t.string :string
      t.date :from_date
      t.date :to_date
      t.references :user, index: true, foreign_key: true
    end
  end
end

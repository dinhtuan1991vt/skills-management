class Skill < ActiveRecord::Base
  belongs_to :skill_category
  validates :name, :description, presence: true
end
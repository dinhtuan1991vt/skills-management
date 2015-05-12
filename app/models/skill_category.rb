class SkillCategory < ActiveRecord::Base
  has_many :skills
  has_many :children, class_name: "SkillCategory", foreign_key: "parent_id"
  belongs_to :parent, class_name: "SkillCategory"

  validates :name, presence: true
end
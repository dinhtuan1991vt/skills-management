class Team < ActiveRecord::Base
  has_many :children, class_name: "Team", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Team"
  has_many :users, dependent: :nullify
  validates :name, presence: true
  has_and_belongs_to_many :skills, join_table: :teams_skills
end
class Rank < ActiveRecord::Base
  has_many :users, dependent: :nullify
  validates :name, presence: true
  has_and_belongs_to_many :skills, join_table: :ranks_skills
end

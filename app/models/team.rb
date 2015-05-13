class Team < ActiveRecord::Base
  has_many :children, class_name: "Team", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Team"
  has_many :users
  validates :name, presence: true
end
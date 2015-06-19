class Assess < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  belongs_to :supervisor, class_name: :User
  validate :score, presence: true
end

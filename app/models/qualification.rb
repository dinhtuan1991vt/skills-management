class Qualification < ActiveRecord::Base
  belongs_to :user
  validates :name, :user, presence: true
  def self.statuses
    [['Nominated', 'nominated'], ['Completing', 'completing'], ['Completed', 'completed']]
  end
end
class Qualification < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true

  def self.statuses
    [['Nominated', 'nominated'], ['Completing', 'completing'], ['Completed', 'completed']]
  end
end
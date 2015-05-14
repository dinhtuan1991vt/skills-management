class Location < ActiveRecord::Base
  validates :name, :latitude, :longitude, presence: true
  validates :latitude, :longitude, numericality: true

  has_many :users, dependent: :nullify
end
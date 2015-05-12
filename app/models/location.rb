class Location < ActiveRecord::Base
  validates :name, :latitude, :longitude, presence: true
  validates :latitude, :longitude, numericality: true
end
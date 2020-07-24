class Track < ApplicationRecord
  
  validates :name, presence: true
  
  belongs_to :simulator
  has_many :laps


end

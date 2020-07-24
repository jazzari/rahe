class Track < ApplicationRecord
  
  validates :name, presence: true
  
  belongs_to :simulator
  has_many :cars, dependent: :destroy
  has_many :laps, :through=> :cars


end

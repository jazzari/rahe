class Car < ApplicationRecord
  
  validates :name, presence: true

  belongs_to :track
  has_many :laps
end

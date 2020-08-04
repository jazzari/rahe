class Track < ApplicationRecord
  
  validates :name, presence: true
  
  belongs_to :simulator
  has_many :cars, dependent: :destroy
  has_many :laps, :through=> :cars

  accepts_nested_attributes_for :cars, allow_destroy: true

end

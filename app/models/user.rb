class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :simulators, dependent: :destroy
    has_many :tracks, :through => :simulators
  has_many :laps, :through => :tracks
end

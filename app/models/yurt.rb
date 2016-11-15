class Yurt < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :timeslots, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
end

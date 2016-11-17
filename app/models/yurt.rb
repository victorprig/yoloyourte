class Yurt < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :timeslots, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

def self.searchyurt(searchclimate, searchshape)
  where("climate ILIKE ? AND shape ILIKE ?", "%#{searchclimate}%", "%#{searchshape}%")
end

end

class Review < ApplicationRecord
  belongs_to :booking
  validates :description, presence: true
  validates :booking_id, presence: true
end

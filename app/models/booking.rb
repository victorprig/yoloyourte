class Booking < ApplicationRecord
  belongs_to :yurt
  belongs_to :user
  has_one :review
end

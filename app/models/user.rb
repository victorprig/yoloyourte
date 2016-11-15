class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :yurts, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

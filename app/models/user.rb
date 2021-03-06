class User < ApplicationRecord
  has_many :trip_users
  has_many :trips, through: :trip_users
  validates :username, uniqueness: { case_sensitive: false }
end

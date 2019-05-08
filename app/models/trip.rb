class Trip < ApplicationRecord
  has_many :trip_users, :dependent => :destroy
  has_many :users, through: :trip_users
  has_many :events, :dependent => :destroy
  has_many :messages, :dependent => :destroy
end

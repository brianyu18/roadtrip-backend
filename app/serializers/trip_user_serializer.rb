class TripUserSerializer < ActiveModel::Serializer
  attributes :id
  has_one :trip_id
  has_one :user_id
end

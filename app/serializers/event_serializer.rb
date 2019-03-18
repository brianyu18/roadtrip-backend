class EventSerializer < ActiveModel::Serializer
  attributes :name, :address, :phone_number, :lng, :lat, :category, :date, :love, :hate, :rating, :price, :photo_reference, :place_id, :reason, :google_url, :website
  has_one :trip_id
end

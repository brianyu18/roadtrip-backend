class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  has_one :trip
  has_one :user
end

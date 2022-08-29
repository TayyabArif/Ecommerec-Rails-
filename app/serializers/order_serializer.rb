class OrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :status, :total
end

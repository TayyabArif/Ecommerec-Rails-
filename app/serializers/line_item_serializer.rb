class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :line_total
  belongs_to :product
  belongs_to :order
end

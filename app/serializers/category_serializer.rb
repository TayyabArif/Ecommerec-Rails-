class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :category, :image_url
  has_many :products
  
  def image_url
    return url_for( object.image)
  end
end

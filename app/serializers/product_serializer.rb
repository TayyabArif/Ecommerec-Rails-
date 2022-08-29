class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :price,:page, :pages, :images
  belongs_to :user
  has_many :comments
  belongs_to :category

  def images
    images = object.images.map do |image|
      url_for(image) if object.images.attached?
    end
  end
  def page
    @instance_options[:page]
 end
 def pages
  @instance_options[:pages]
 end
end

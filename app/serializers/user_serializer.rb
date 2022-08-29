class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :surname, :email, :orders, :avatar_url
  # has_many  :orders
  def avatar_url
    # variant = object.avatar.variant(resize: "100x100")
    return url_for(object.avatar) if object.avatar.attached?
  end
end 
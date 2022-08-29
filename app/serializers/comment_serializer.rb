class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :user, :page, :pages
  belongs_to :user
  belongs_to :product
  def created_at
    object.created_at.strftime("%Y-%m-%d ")
  end
  def page
     @instance_options[:page]
  end
  def pages
   @instance_options[:pages]
  end

end

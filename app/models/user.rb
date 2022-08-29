class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :confirmable,
         jwt_revocation_strategy: JwtDenylist
         
  ##...Avatar Attachment...##
  has_one_attached :avatar,  dependent: :destroy

  ## Validations
  validates :avatar, file_size: { less_than_or_equal_to: 5.megabytes },
      file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }

 has_many :products,  dependent: :destroy
 has_many :comments,  dependent: :destroy
 has_many :orders,  dependent: :destroy

 validates :email, presence: true, uniqueness: true
end

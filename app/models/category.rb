class Category < ApplicationRecord
    has_many :products, dependent: :destroy

    has_one_attached :image

    validates :image, file_size: { less_than_or_equal_to: 5.megabytes },
    file_content_type: { allow: ['image/jpeg', 'image/png', 'image/jpg'] }
end

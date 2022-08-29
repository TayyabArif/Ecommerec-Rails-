class Product < ApplicationRecord
    before_create :assign_unique_code
    belongs_to :user
    has_many :line_items, dependent: :destroy
    has_many :orders, through: :line_items , dependent: :destroy
    has_many :comments,  dependent: :destroy
    belongs_to :category
    has_many_attached :images, dependent: :destroy
    self.per_page = 9

    private
    CODE_NUMBER_RANGE = (10_000..99_999)
    def assign_unique_code
        self.code = loop do
          number = rand(CODE_NUMBER_RANGE)
          break number unless Product.exists?(code: number)
        end
    end
end

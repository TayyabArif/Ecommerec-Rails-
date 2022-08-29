class Order < ApplicationRecord
    before_save :total_price
    has_many :line_items, dependent: :destroy
    has_many :products, through: :line_items
    belongs_to :user

    enum status: [:inprogress, :completed]

    scope :in_progress, -> { where(status: 0) }
    def total_price
        total=0
        self.line_items.each do |line_item|
          total = total + line_item.line_total
        end
        self.total = total
        return self.total
    end
end

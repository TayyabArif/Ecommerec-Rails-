class LineItem < ApplicationRecord
    before_save :sub_total
    belongs_to :product
    belongs_to :order
    # logger= Rails.logger
    def sub_total
        # logger.info "Called"
        self.line_total= self.quantity * self.product.price
    end
end
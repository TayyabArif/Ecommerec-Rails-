class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product 
  self.per_page = 8
end

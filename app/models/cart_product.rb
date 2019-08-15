class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :num_product, presence: true
end

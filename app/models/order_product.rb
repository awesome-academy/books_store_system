class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :num_product, presence: true
end

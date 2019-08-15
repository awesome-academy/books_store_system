class Cart < ApplicationRecord
  has_many :cart_products
  has_many :orders
end

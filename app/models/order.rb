class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  enum deliver_status: {processing: 0, cancel: 1, success: 2}
  validates :receiver, presence: true
end

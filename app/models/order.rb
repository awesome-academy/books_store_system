class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  enum deliver_status: {processing: 0, cancel: 1, success: 2}

  ORDER_PARAMS = %i(receiver phone address total_price).freeze

  validates :receiver, presence: true
end

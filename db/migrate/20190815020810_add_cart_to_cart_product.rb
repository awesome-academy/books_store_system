class AddCartToCartProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_products, :cart_id, :integer, foreign_key: true
  end
end

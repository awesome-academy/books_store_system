class RemoveOrderFromCartProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_products, :order_id, :integer
  end
end

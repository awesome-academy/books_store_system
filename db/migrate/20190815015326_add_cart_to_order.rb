class AddCartToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cart_id, :integer, foreign_key: true
  end
end

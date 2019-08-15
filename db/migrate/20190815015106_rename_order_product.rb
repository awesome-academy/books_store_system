class RenameOrderProduct < ActiveRecord::Migration[5.2]
  def change
    rename_table(:order_products, :cart_products)
  end
end

class AddFeeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :fee, :decimal, precision: 7, scale: 2
  end
end

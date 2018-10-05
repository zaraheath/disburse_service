class CreateDisbursementOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :disbursement_orders do |t|
      t.references :disbursement
      t.references :order
      t.timestamps
    end
  end
end

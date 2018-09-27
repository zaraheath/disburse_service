# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :merchant
      t.references :shopper
      t.decimal :amount, precision: 7, scale: 2
      t.datetime :completed_at
      t.timestamps
    end
  end
end

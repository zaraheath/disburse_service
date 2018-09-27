# frozen_string_literal: true

class CreateDisbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :disbursements do |t|
      t.references :merchant
      t.decimal :fee, precision: 7, scale: 2
      t.datetime :week
      t.timestamps
    end
  end
end

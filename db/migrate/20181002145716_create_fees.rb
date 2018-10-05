class CreateFees < ActiveRecord::Migration[5.2]
  def change
    create_table :fees do |t|
      t.references :merchant
      t.integer :min
      t.integer :max
      t.decimal :fee, precision: 5, scale: 4
      t.timestamps
    end
  end
end

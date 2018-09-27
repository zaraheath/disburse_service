class ChangeWeekToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :disbursements, :week, :date
  end
end

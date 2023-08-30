class RenameBillStatusToPaid < ActiveRecord::Migration[7.0]
  def change
    rename_column :bills, :status, :paid
  end
end

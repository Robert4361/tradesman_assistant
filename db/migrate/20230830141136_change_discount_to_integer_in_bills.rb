class ChangeDiscountToIntegerInBills < ActiveRecord::Migration[7.0]
  def change
    change_column :bills, :discount, :integer
  end
end

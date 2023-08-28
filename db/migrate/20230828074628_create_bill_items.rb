class CreateBillItems < ActiveRecord::Migration[7.0]
  def change
    create_table :bill_items do |t|
      t.integer :quantity
      t.references :bill, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end

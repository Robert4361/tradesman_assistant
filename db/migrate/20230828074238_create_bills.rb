class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.date :date
      t.boolean :status
      t.decimal :discount
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

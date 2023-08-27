class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :post_number
      t.string :city
      t.integer :pid
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class AddTableCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :store_name, limit: 200, null: false
      t.string :city, limit: 60, null: false
      t.string :state, limit: 2, null: false
      t.string :local_address, limit: 255, null: false #(street name, number and additional information)
      t.string :phone, limit: 30, null: false
      t.string :email, limit: 60, null: false
      t.string :cnpj

      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end

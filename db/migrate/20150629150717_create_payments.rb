class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :account, index: true, foreign_key: true
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end

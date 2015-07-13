class CreateRecurringPayments < ActiveRecord::Migration
  def change
    create_table :recurring_payments do |t|
      t.references :account, index: true, foreign_key: true
      t.text :schedule
      
      t.timestamps null: false
    end
  end
end

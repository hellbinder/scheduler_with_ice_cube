class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, limit: 30
      t.text :description

      t.timestamps null: false
    end
  end
end

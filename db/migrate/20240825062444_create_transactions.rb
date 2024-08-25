class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 16, scale: 2, null: false

      t.timestamps
    end
  end
end

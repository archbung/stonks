class CreateWallets < ActiveRecord::Migration[7.2]
  def change
    create_table :wallets do |t|
      t.decimal :balance, precision: 16, scale: 2, null: false

      t.timestamps
    end
  end
end

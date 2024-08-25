class AddDestinationWalletIdToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :destination_wallet_id, :integer, null: false
    add_index :transactions, :destination_wallet_id
    add_foreign_key :transactions, :wallets, column: :destination_wallet_id
  end
end

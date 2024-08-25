class RemoveEntityIdFromWallets < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :wallets, :entities
    remove_column :wallets, :entity_id, :integer
  end
end

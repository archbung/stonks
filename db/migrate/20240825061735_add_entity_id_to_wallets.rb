class AddEntityIdToWallets < ActiveRecord::Migration[7.2]
  def change
    add_column :wallets, :entity_id, :integer, null: false
    add_index :wallets, :entity_id
    add_foreign_key :wallets, :entities, column: :entity_id
  end
end

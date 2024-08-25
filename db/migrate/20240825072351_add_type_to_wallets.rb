class AddTypeToWallets < ActiveRecord::Migration[7.2]
  def change
    add_column :wallets, :type, :string, null: false
  end
end

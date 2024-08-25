class AddUserAndPasswordDigestToWallets < ActiveRecord::Migration[7.2]
  def change
    add_column :wallets, :user, :string, null: false
    add_column :wallets, :password_digest, :string, null: false
  end
end

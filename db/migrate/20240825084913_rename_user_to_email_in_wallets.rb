class RenameUserToEmailInWallets < ActiveRecord::Migration[7.2]
  def change
    rename_column :wallets, :user, :email
  end
end

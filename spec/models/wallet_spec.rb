require 'rails_helper'

RSpec.describe Wallet, type: :model do
  it "can create new User" do
    wallet = create :wallet
    created_wallet = Wallet.find_by(id: wallet.id)

    expect(wallet.entity).to be_present
    expect(created_wallet).to eq wallet
  end

  it "can transfer money to a different wallet" do
    source_wallet = create :wallet
    destination_wallet = create :wallet

    source_wallet.transfer(to: destination_wallet, amount: 50_000)
    transaction = Transaction.find_by(source_wallet_id: source_wallet.id)

    expect(transaction.amount).to eq 50_000
    expect(source_wallet.balance).to eq 50_000
    expect(destination_wallet.balance).to eq 150_000
  end
end

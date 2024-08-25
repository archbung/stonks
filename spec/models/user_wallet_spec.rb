require 'rails_helper'

RSpec.describe UserWallet, type: :model do
  it "can create new UserWallet" do
    wallet = create :user_wallet
    created_wallet = UserWallet.find_by(id: wallet.id)

    expect(wallet.entity).to be_present
    expect(created_wallet).to eq wallet
  end

  it "can transfer money to a different wallet" do
    source_wallet = create :user_wallet
    destination_wallet = create :user_wallet

    source_wallet.transfer(to: destination_wallet, amount: 50_000)
    transaction = Transaction.find_by(source_wallet_id: source_wallet.id)

    expect(transaction.amount).to eq 50_000
    expect(source_wallet.balance).to eq 50_000
    expect(destination_wallet.balance).to eq 150_000
  end

  it "can calculate cumulative_balance" do
    source_wallet = create :user_wallet
    destination_wallet = create :user_wallet

    source_wallet.transfer(to: destination_wallet, amount: 50_000)
    source_wallet.transfer(to: destination_wallet, amount: 50_000)

    first_transaction = Transaction.where(source_wallet_id: source_wallet.id).first
    second_transaction = Transaction.where(source_wallet_id: source_wallet.id).last

    expect(source_wallet.balance_at(datetime: first_transaction.created_at)).to eq 50_000
    expect(source_wallet.balance_at(datetime: second_transaction.created_at)).to eq 0
  end
end

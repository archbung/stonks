require 'rails_helper'

RSpec.describe UserWallet, type: :model do
  it "can create new UserWallet" do
    wallet = create :user_wallet
    created_wallet = UserWallet.find_by(id: wallet.id)

    expect(created_wallet).to eq wallet
  end

  it "can transfer money to a different wallet" do
    source_wallet = create :user_wallet
    destination_wallet = create :user_wallet, email: "kaesangp"

    source_wallet.transfer(to: destination_wallet, amount: 50_000)
    transaction = Transaction.find_by(source_wallet_id: source_wallet.id)

    expect(transaction.amount).to eq 50_000
    expect(source_wallet.balance).to eq 50_000
    expect(destination_wallet.balance).to eq 150_000
  end

  it "can calculate cumulative_balance" do
    source_wallet = create :user_wallet
    destination_wallet = create :user_wallet, email: "kaesangp"
    third_wallet = create :user_wallet, email: "gibranrk"

    source_wallet.transfer(to: destination_wallet, amount: 50_000)
    source_wallet.transfer(to: destination_wallet, amount: 50_000)
    third_wallet.transfer(to: source_wallet, amount: 25_000)

    trx = Transaction.where("source_wallet_id = #{source_wallet.id} OR destination_wallet_id = #{source_wallet.id}")

    expect(source_wallet.balance_at(datetime: trx[0].created_at)).to eq 50_000
    expect(source_wallet.balance_at(datetime: trx[1].created_at)).to eq 0
    expect(source_wallet.balance_at(datetime: trx[2].created_at)).to eq 25_000
  end
end

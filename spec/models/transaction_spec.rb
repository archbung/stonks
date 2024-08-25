require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "can create new transaction" do
    transaction = create :transaction
    created_transaction = Transaction.find_by(id: transaction.id)

    expect(created_transaction.source_wallet_id).to be_present
    expect(created_transaction.destination_wallet_id).to be_present
    expect(created_transaction).to eq transaction
  end
end

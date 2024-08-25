require 'rails_helper'

RSpec.describe Wallet, type: :model do
  it "can create new User" do
    wallet = create :wallet
    created_wallet = Wallet.find_by(id: wallet.id)

    expect(wallet.entity).to be_present
    expect(created_wallet).to eq wallet
  end
end

FactoryBot.define do
  factory :transaction do
    amount { 50_000 }
    source_wallet_id { create(:user_wallet).id }
    destination_wallet_id { create(:user_wallet).id }
  end
end

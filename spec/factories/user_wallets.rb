FactoryBot.define do
  factory :user_wallet do
    balance { 100_000 }
    entity_id { create(:user).id }
  end
end

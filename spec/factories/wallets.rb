FactoryBot.define do
  factory :wallet do
    balance { 100_000 }
    entity_id { create(:user).id }
  end
end

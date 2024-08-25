FactoryBot.define do
  factory :user_wallet do
    balance { 100_000 }
    user { "Mukidi" }
    password_digest { "Jancoek" }
  end
end

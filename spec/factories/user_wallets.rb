FactoryBot.define do
  factory :user_wallet do
    balance { 100_000 }
    email { "mukidi@mulyono.net" }
    password_digest { "Jancoek" }
  end
end

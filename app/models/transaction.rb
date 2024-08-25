class Transaction < ApplicationRecord
  validates_numericality_of :amount, greater_than_or_equal_to: 0

  belongs_to :source_wallet, class_name: "Wallet"
  belongs_to :destination_wallet, class_name: "Wallet"
end

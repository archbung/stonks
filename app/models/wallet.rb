class Wallet < ApplicationRecord
  validates_numericality_of :balance, greater_than_or_equal_to: 0, on: [ :create ]

  belongs_to :entity
  has_many :sent_transactions, class_name: "Transaction", foreign_key: "source_wallet_id"
  has_many :received_transactions, class_name: "Transaction", foreign_key: "destination_wallet_id"
end

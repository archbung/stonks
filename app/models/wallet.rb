class Wallet < ApplicationRecord
  validates_numericality_of :balance, greater_than_or_equal_to: 0, on: [ :create ]

  belongs_to :entity
  has_many :sent_transactions, class_name: "Transaction", foreign_key: "source_wallet_id"
  has_many :received_transactions, class_name: "Transaction", foreign_key: "destination_wallet_id"

  def transfer(to:, amount:)
    return unless self.balance >= amount

    ActiveRecord::Base.transaction do
      Transaction.create!(
        amount:,
        source_wallet_id: self.id,
        destination_wallet_id: to.id
      )

      self.balance = self.balance - amount
      to.balance = to.balance + amount
    end
  end
end

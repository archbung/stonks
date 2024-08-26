class Wallet < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_numericality_of :balance, greater_than_or_equal_to: 0, on: [ :create ]

  has_many :sent_transactions, class_name: "Transaction", foreign_key: "source_wallet_id"
  has_many :received_transactions, class_name: "Transaction", foreign_key: "destination_wallet_id"

  def initialize(*args)
    raise "Cannot directly instantiate an abstract class #{self.class}" if self.instance_of?(Wallet)
    super
  end

  def transfer(to:, amount:)
    return unless self.balance >= amount

    new_source_balance = self.balance - amount
    new_destination_balance = to.balance + amount
    ActiveRecord::Base.transaction do
      Transaction.create!(
        amount:,
        source_cumulative_balance: new_source_balance,
        destination_cumulative_balance: new_destination_balance,
        source_wallet_id: self.id,
        destination_wallet_id: to.id
      )

      self.balance = new_source_balance
      to.balance = new_destination_balance
    end
  end

  def balance_at(datetime:)
    last_transaction_before_datetime = Transaction
      .where("source_wallet_id = #{self.id} OR destination_wallet_id = #{self.id}")
      .where("created_at <= ?", datetime)
      .order(created_at: :desc)
      .first

    return 0 if last_transaction_before_datetime.nil?

    # cumulative_balance is the current balance up to and including the current trx
    return last_transaction_before_datetime.source_cumulative_balance if last_transaction_before_datetime.source_wallet_id == self.id
    last_transaction_before_datetime.destination_cumulative_balance if last_transaction_before_datetime.destination_wallet_id == self.id
  end
end

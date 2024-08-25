class Wallet < ApplicationRecord
  validates_numericality_of :balance, greater_than_or_equal_to: 0, on: [ :create ]

  belongs_to :entity
end

class AddDestinationCumulativeBalanceToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :destination_cumulative_balance, :decimal, precision: 16, scale: 2
  end
end

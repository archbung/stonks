class AddSourceCumulativeBalanceToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :source_cumulative_balance, :decimal, precision: 16, scale: 2
  end
end

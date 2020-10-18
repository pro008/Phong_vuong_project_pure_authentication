class AddAccountIdToTransaction < ActiveRecord::Migration[6.0]
  def change
  	add_column :transactions, :account_id, :integer, index: true
  end
end

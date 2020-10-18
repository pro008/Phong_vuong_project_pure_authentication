class AddUserIdToTransaction < ActiveRecord::Migration[6.0]
  def change
  	add_column :transactions, :user_id, :integer, index: true
  end
end

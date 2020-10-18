class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.integer :transaction_type

      t.timestamps
    end
  end
end

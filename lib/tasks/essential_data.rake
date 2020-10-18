task add_transaction: :environment do
  user = User.create(name: "Vuong Tin Phong", bank_name: User.bank_names[:ACB], 
  								   email: "phong.vuong008@gmail.com", 
  								   password: "foobar", password_confirmation: "foobar")

  (0..10).each do |i|
  	user.transactions.create(amount: 100, transaction_type: Transaction.transaction_types[:withdraw], account_id: i)
  	user.transactions.create(amount: 200, transaction_type: Transaction.transaction_types[:deposit], account_id: i)

  end
  
end

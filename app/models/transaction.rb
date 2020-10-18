class Transaction < ApplicationRecord
	belongs_to :user

	enum transaction_type: { withdraw: 0, deposit: 1 }
	validates :transaction_type, presence: true
end

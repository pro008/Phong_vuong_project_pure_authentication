class TransactionsController < ApplicationController
  include CurrentUserConcern

  def new
    if current_user.present?
      @transaction = current_user.transactions.new
    else
      redirect_to root_url
    end
  end

  def create
    @transaction = current_user.transactions.new(transaction_params)
    if @transaction.save
      redirect_to user_path(current_user)
    else
      render root_url
    end
  end

   private

    def transaction_params
    	param = params.dup
    	param["transaction"]["amount"] = param["transaction"]["amount"].to_f
      param.require(:transaction).permit(:amount, :transaction_type)
    end

end
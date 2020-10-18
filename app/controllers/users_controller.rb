class UsersController < ApplicationController
  include CurrentUserConcern

  skip_before_action :logged_in_user
  before_action :logged_in_user, only: [:index]
  before_action :correct_user,   only: [:edit, :update, :show]

  def show
    @transactions = @user.transactions.all
  end

  def api_transaction
    user = User.find_by(id: params[:id])

    if user
      if params["account_id"]
        transactions = user.transactions.where(account_id: params["account_id"])
      else
        transactions = user.transactions.all
      end

      results = transactions.map{|t| {id: t.id, transaction_type: t.transaction_type, account_id: t.account_id,
                                      created_at: t.created_at, user_id: t.user_id}}

      render json: results
    else

      render json: {message: 401} 
    end
  end

  def login
    if request.post?
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        forwarding_url = session[:forwarding_url]
        reset_session
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        log_in user
        redirect_to forwarding_url || user
      else
        render 'new'
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :bank_name, :password,
                                   :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
    end
end
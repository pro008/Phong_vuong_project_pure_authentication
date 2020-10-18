module CurrentUserConcern 
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_user
  end

  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
    before_action :require_authenticate
  end

  private
    def authenticate
      if authenticated_user = User.find_by(id: session[:user_id])
        Current.user = authenticated_user
      end
    end

    def require_authenticate
      redirect_to login_path unless Current.user
    end
end

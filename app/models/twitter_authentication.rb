class TwitterAuthentication < ApplicationRecord
  has_one :user_authentication, as: :authenticationable
  def user_id
    user_authentication.user_id
  end
end

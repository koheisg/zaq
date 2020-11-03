class UserAuthentication < ApplicationRecord
  belongs_to :authenticationable, polymorphic: true
  belongs_to :user
end

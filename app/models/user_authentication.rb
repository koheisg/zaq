class UserAuthentication < ApplicationRecord
  belongs_to :authenticationable, polymorphic: true
end

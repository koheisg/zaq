class User < ApplicationRecord
  has_many :questions
  has_many :answers

  # enum :state, [:active, :ban]

  def icon
    "https://avatars.poiit.me/api/twitter/#{name}"
  end

  def account
  end

  def time_zone
  end
end

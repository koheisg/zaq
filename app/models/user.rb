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

  def to_key
    ["@#{name}"]
  end

  def to_param
    "@#{name}"
  end

  def profile
    prof = OpenStruct.new
    prof.name = name
    prof.url = "https://medium.com/@#{name}"
    prof
  end
end

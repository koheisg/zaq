class Question < ApplicationRecord
  has_rich_text :content
  has_many :answers

  validates :title, :content, presence: true

  def user_name
    ['bob','alice','jiro','john'].sample
  end

  def user_icon
    ['https://avatars.poiit.me/api/twitter/bob',
     'https://avatars.poiit.me/api/twitter/alice',
     'https://avatars.poiit.me/api/twitter/jiro',
     'https://avatars.poiit.me/api/twitter/john'].sample
  end
end

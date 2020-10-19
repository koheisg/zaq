class Question < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :answers

  validates :title, :content, presence: true

  delegate :name, :icon, to: :user, prefix: true
end

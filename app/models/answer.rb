class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :content, presence: true
  has_rich_text :content

  delegate :name, :icon, to: :user, prefix: true

  default_scope { order(created_at: :desc) }
end

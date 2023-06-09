class User < ApplicationRecord
  has_many :likes, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy

  scope :user_recent_posts, ->(user_id) { find(user_id).posts.order(created_at: :desc).limit(3) }

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end

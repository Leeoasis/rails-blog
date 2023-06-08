class User < ApplicationRecord
  has_many :likes, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy

  scope :user_recent_posts, ->(user_id) { find(user_id).posts.order(created_at: :desc).limit(3) }
end

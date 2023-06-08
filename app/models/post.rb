class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  scope :update_posts_counter, -> { User.find(3).update(posts_counter: User.find(3).posts.count) }
  scope :recent_comments, -> { Comment.where(post_id: 2).order(created_at: :desc).first(5) }
end

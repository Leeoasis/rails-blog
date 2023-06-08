class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  def self.update_posts_counter(user_id)
    user = User.find(user_id)
    user.update(posts_counter: user.posts.count)
  end

  scope :recent_comments, ->(post_id) { Comment.where(post_id:).order(created_at: :desc).limit(5) }
end

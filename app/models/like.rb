class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  def self.update_post_likes(post_id)
    post = Post.find(post_id)
    post.update(likes_counter: post.likes.count)
  end
end

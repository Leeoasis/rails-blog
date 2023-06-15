class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  def self.update_comment_counter(post_id)
    post = Post.find(post_id)
    post.update(comment_counter: post.comments.count)
  end
end

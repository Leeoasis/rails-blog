class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_create :update_post_comments_counter
  after_destroy :update_post_comments_counter

  def update_post_comments_counter
    self.class.update_comment_counter(post_id)
  end

  def self.update_comment_counter(post_id)
    post = Post.find(post_id)
    post.update(comment_counter: post.comments.count)
  end
end

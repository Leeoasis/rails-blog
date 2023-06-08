class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  scope :update_comment_counter, -> { Post.find(3).update(comments_counter: Comment.where(post_id: 3).size) }
end

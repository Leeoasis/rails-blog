class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  scope :update_post_likes, -> { Post.find(2).update(likes_counter: Like.where(post_id: 2).size) }
end

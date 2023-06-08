class User < ApplicationRecord
    has_many :posts, foreign_key: :author_id, dependent: :destroy
    has_many :comments, foreign_key: :author_id, dependent: :destroy
    has_many :likes, foreign_key: :author_id, dependent: :destroy
  
    after_create_commit :initialize_posts_counter
    after_destroy_commit :update_posts_counter
  
    private
  
    def initialize_posts_counter
      update(posts_counter: 0) if posts_counter.nil?
    end
  
    def update_posts_counter
      update(posts_counter: posts.count)
    end
  end
  
has_many :likes, foreign_key: :author_id, dependent: :destroy
has_many :comments, foreign_key: :author_id, dependent: :destroy
has_many :posts, foreign_key: :author_id, dependent: :destroy

scope :user_recent_posts, -> { find(2).posts.order(created_at: :desc).first(3) }
end
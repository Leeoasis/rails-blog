require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { Post.create(title: 'Sample Post', author: user) }

  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    it { should belong_to(:post) }
  end

  describe 'increment_post_likes_counter' do
    it 'increments the likes_counter of the post' do
      post.update(likes_counter: 2)
      Like.create(author: user, post: post)
      post.reload
      expect(post.likes_counter).to eq(1)
    end
  end
end

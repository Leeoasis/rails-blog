require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'update_posts_counter' do
    let(:user) { User.create!(name: 'John', posts_counter: 0) }
    let!(:post1) { user.posts.create!(title: 'Post 1', likes_counter: 0) }
    let!(:post2) { user.posts.create!(title: 'Post 2', likes_counter: 0) }

    it 'updates the posts_counter of the user' do
      expect do
        Post.update_posts_counter(user.id)
      end.to change { user.reload.posts_counter }.from(0).to(2)
    end
  end

  describe 'recent_comments' do
    let(:author) { User.create!(name: 'John') }
    let(:post) { Post.create!(title: 'Sample Post', author:) }

    it 'returns the 5 most recent comments for the post' do
      comment1 = post.comments.create!(text: 'Comment 1', created_at: 3.days.ago, author_id: author.id)
      comment2 = post.comments.create!(text: 'Comment 2', created_at: 2.days.ago, author_id: author.id)
      comment3 = post.comments.create!(text: 'Comment 3', created_at: 1.day.ago, author_id: author.id)
      comment4 = post.comments.create!(text: 'Comment 4', created_at: 4.days.ago, author_id: author.id)
      comment5 = post.comments.create!(text: 'Comment 5', created_at: 5.days.ago, author_id: author.id)
      post.comments.create!(text: 'Comment 6', created_at: 6.days.ago, author_id: author.id)

      recent_comments = Post.recent_comments(post.id)

      expect(recent_comments).to eq([comment3, comment2, comment1, comment4, comment5])
    end
  end
end

require 'rails_helper'
require_relative '../../app/models/post'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:posts).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'user_recent_posts' do
    let(:user) { User.create!(name: 'John', posts_counter: 0) }

    it 'returns an empty array if the user has no posts' do
      # Call the scope for a user with no posts
      recent_posts = User.user_recent_posts(user.id)

      # Expect the scope to return an empty array
      expect(recent_posts).to eq([])
    end
  end
end

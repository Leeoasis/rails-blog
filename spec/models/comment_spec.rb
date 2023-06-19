require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    it { should belong_to(:post) }
  end

  # describe 'update_post_comments_counter' do
  #   let(:post) { Post.create!(title: 'Sample Post', author: author) }
  #   let(:author) { User.create!(name: 'John') }

  #   it 'updates the comment_counter of the post' do
  #     expect do
  #       Comment.create(text: 'Sample Comment', author: author, post: post)
  #       Comment.update_comment_counter(post.id)
  #       post.reload
  #     end.to change { post.comment_counter }.from(nil).to(1)
  #   end
  # end
end

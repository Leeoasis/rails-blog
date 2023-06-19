require 'rails_helper'

RSpec.describe '/posts', type: :request do
  describe 'PostsController' do
    let(:user) { User.create(name: 'John Doe') }
    let(:post) { Post.create(title: 'Sample Post', author: user) }

    context 'GET index' do
      before(:example) do
        get "/users/#{user.id}/posts"
      end

      it 'returns a successful response for index action' do
        expect(response).to be_successful
      end

      it 'renders the correct template for index action' do
        expect(response).to render_template(:index)
      end

      it 'renders the correct body placeholder text' do
        expect(response.body).to include('No posts')
      end
    end

    context 'GET show' do
      before(:example) do
        get "/users/#{user.id}/posts/#{post.id}"
      end

      it 'returns a successful response for show action' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the correct template for show action' do
        expect(response).to render_template(:show)
      end
    end
  end
end

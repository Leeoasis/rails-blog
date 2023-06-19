require 'rails_helper'

RSpec.describe '/users', type: :request do
  describe 'UsersController' do
    context 'GET index' do
      before(:example) do
        get '/users'
      end

      # it 'success for index action' do
      #   expect(response).to have_http_status(:success)
      # end

      # it 'Render correct templete for index action' do
      #   expect(response).to render_template(:index)
      # end

      # it 'Correct body placeholder text for index action' do
      #   expect(response.body).to include('List of all users')
      # end
    end

    
  end
end

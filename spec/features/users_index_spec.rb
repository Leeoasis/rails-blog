require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before do
    @user1 = User.create(name: 'User 1', posts_counter: 3)
    @user2 = User.create(name: 'User 2', posts_counter: 5)

    visit users_path
  end

  scenario 'I can see the username, profile picture, and number of posts for each user' do
    expect(page).to have_content('User 1')
    expect(page).to have_content('User 2')
    expect(page).to have_selector('img[src*="user1_photo.jpg"]')
    expect(page).to have_selector('img[src*="user2_photo.jpg"]')
    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_content('Number of posts: 5')
  end

  scenario 'When I click on a user, I am redirected to their show page' do
    click_link 'User 1'
    expect(current_path).to eq(user_path(@user1))

    visit users_path

    click_link 'User 2'
    expect(current_path).to eq(user_path(@user2))
  end
end

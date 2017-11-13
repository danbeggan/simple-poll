require 'rails_helper'

RSpec.feature "Home", type: :feature do
  it 'shows home page' do
    visit '/'
    page.should have_content('Latest Polls')
  end

  it 'does not show My Polls if user not signed in' do
    visit '/'
    page.should_not have_content('My Polls')
  end

  it 'shows My Polls if user signed in' do
    create :user, email: 'user@example.com', password: 'password'

    visit '/users/sign_in'

    within('#new_user') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end

    click_button 'Log in'

    page.should have_content('My polls')
  end
end

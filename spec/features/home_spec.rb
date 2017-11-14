require 'rails_helper'

RSpec.feature 'Home', type: :feature do
  it 'shows home page' do
    visit '/'
    page.should have_content('Latest Polls')
  end

  it 'does not show My Polls if user not signed in' do
    visit '/'
    page.should_not have_content('My Polls')
  end
end

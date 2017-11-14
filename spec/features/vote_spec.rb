require 'rails_helper'

RSpec.feature 'Vote', type: :feature do
  it 'does not show vote div after vote cast' do
    poll = create :poll, :with_answer

    visit '/polls/' + poll.id.to_s

    within('.answers') do
      click_link 'Vote'
    end

    page.should_not have_button('Vote')
  end
end

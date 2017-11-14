require 'rails_helper'

RSpec.describe Poll, type: :model do
  it 'requires at least one answer' do
    poll = build :poll
    expect(poll).to be_invalid
  end

  it 'is valid with at least one answer' do
    poll = build :poll, :with_answer
    expect(poll).to be_valid
  end
end

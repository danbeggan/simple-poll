require 'rails_helper'

RSpec.describe Poll, type: :model do

  it "has requires at least one answer" do
    poll = build :poll
    expect(poll).to be_invalid
  end


  it "has requires at least one answer" do
    poll = build :poll, :with_answer
    expect(poll).to be_valid
  end

end

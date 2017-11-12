require 'rails_helper'

RSpec.describe Poll do
  describe '#name' do
    it 'validates presence of name' do
      # poll = Poll.new
      # poll.save.errors[:name].should include("can't be blank")

      # poll.name = 'Whats your favourite color?'
      # poll.errors[:answer].should include("can't be blank")
    end
  end
end

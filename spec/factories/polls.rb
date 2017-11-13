FactoryGirl.define do
  factory :poll do
    name 'What time is it?'

    trait :with_answer do
      after(:build) { |poll| poll.answers << build(:answer) }
    end
  end
end

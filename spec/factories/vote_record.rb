FactoryGirl.define do
  factory :vote_record do
    ip          { Faker::Internet.ip_v4_address }
    answer_id   '1'
  end
end

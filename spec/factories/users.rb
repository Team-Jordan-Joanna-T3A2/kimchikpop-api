FactoryBot.define do
  factory :user do
    password {'password'}
    user_type {'hostess'}
    sequence(:username) { |n| "user_#{n}" }
  end
end
  
FactoryBot.define do
  factory :reservation do
    first_name {'John'}
    last_name {'Doe'}
    email {'john@email.com'}
    phone_number {'042345678'}
    time {Date.current + 1.day}
    pax {2}
    sequence(:code) { |n| "AAA#{n}" }
    confirmed {true}
  end
end
  
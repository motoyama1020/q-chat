FactoryBot.define do
  factory :user do
    name                                {Faker::Name.last_name}
    email                               {Faker::Internet.free_email}
    password = Faker::Lorem.characters(min_alpha: 1, min_numeric: 1, number: 8)
    password                            {password}
    password_confirmation               {password}
    event_time = Faker::Number.number
    clear_time = Faker::Number.number
  end
end

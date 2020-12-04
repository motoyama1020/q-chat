FactoryBot.define do
  factory :user do
    name                                {Faker::Name.last_name}
    email                               {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password                            {password}
    password_confirmation               {password}
    event_time = Faker::Number.number
    clear_time = Faker::Number.number
  end
end

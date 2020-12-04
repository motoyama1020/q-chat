FactoryBot.define do
  factory :room do
    name                        { Faker::Team.name }
    capacity_id                 { Faker::Number.between(from: 1, to: 5) }
    year_id                     { Faker::Number.between(from: 1, to: 3) }
    month_id                    { Faker::Number.between(from: 1, to: 12) }
    prefecture_id               { Faker::Number.between(from: 1, to: 47) }
  end
end

FactoryBot.define do
  factory :value do
    value {Faker::Number.decimal(l_digits: 2)}
    measure_id { nil }
  end
end
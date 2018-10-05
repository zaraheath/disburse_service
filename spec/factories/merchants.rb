# frozen_string_literal: true

FactoryBot.define do
  factory :merchant do
    cif { "B#{Faker::Number.number(9)}" }
    name { Faker::Company.name }
    email { Faker::Internet.email }

    trait :with_fees do
      after(:create) do |o|
        o.fees.create(min: 0, max: 50, fee: 0.01)
        o.fees.create(min: 51, max: 300, fee: 0.01)
      end
    end
  end
end

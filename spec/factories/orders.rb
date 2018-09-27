# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    amount { Faker::Number.number(5) }

    merchant
    shopper

    trait :completed do
      completed_at { Time.now }
    end
  end
end

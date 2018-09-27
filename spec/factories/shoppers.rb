# frozen_string_literal: true

FactoryBot.define do
  factory :shopper do
    nif { "B#{Faker::Number.number(9)}" }
    name { Faker::Company.name }
    email { Faker::Internet.email }
  end
end

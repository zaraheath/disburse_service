# frozen_string_literal: true

FactoryBot.define do
  factory :merchant do
    cif { "B#{Faker::Number.number(9)}" }
    name { Faker::Company.name }
    email { Faker::Internet.email }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :disbursement do
    fee { Faker::Number.number(2) }
    week { Time.now }

    merchant
  end
end

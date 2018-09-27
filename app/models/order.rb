# frozen_string_literal: true

class Order < ApplicationRecord
  # Validations
  validates :merchant, presence: true
  validates :shopper, presence: true
  validates :amount, presence: true

  # Relations
  belongs_to :merchant
  belongs_to :shopper

  # Callbacks
end

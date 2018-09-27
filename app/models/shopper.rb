# frozen_string_literal: true

class Shopper < ApplicationRecord
  # Validations
  validates :nif, length: { maximum: 10 }, presence: true
  validates :name, presence: true
  validates :email, presence: true

  # Relations

  # Callbacks
end

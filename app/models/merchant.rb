# frozen_string_literal: true

class Merchant < ApplicationRecord
  # Validations
  validates :cif, length: { maximum: 10 }, presence: true
  validates :name, presence: true
  validates :email, presence: true

  # Relations
  has_many :orders
  has_many :disbursements
  has_many :fees

  # Callbacks
end

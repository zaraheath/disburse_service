# frozen_string_literal: true

class Disbursement < ApplicationRecord
  # Validations
  validates :merchant, presence: true
  validates :week, presence: true
  validates :fee, presence: true

  # Relations
  belongs_to :merchant
  has_many :disbursement_orders
  has_many :orders, through: :disbursement_orders

  # Scopes
  scope :by_week, ->(time) { where(week: time) }
end

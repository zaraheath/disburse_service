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
  before_commit :calculate_fee, if: :completed?

  # Scopes
  scope :completed, -> { where.not(completed_at: nil) }

  private

  def calculate_fee
    self.fee = OrderFee.new(amount).calculate
  end

  def completed?
    completed_at.present?
  end
end

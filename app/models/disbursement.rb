# frozen_string_literal: true

class Disbursement < ApplicationRecord
  # Validations
  validates :merchant, presence: true
  validates :week, presence: true
  validates :fee, presence: true

  # Relations
  belongs_to :merchant

  # Callbacks
end

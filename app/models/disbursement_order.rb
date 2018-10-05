class DisbursementOrder < ApplicationRecord
  belongs_to :order
  belongs_to :disbursement
end

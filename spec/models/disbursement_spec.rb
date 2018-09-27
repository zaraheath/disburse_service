# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Disbursement, 'validations', type: :model do
  it { is_expected.to validate_presence_of(:merchant) }
  it { is_expected.to validate_presence_of(:week) }
  it { is_expected.to validate_presence_of(:fee) }
end

RSpec.describe Disbursement, 'relations', type: :model do
  it { is_expected.to belong_to(:merchant) }
end

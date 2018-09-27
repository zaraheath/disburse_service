# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Merchant, 'validations', type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:cif) }
  it { is_expected.to validate_length_of(:cif) }
end

RSpec.describe Merchant, 'relations', type: :model do
  it { is_expected.to have_many(:orders) }
  it { is_expected.to have_many(:disbursements) }
end

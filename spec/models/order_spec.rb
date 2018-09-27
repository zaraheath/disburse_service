# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, 'validations', type: :model do
  it { is_expected.to validate_presence_of(:merchant) }
  it { is_expected.to validate_presence_of(:shopper) }
  it { is_expected.to validate_presence_of(:amount) }
end

RSpec.describe Order, 'relations', type: :model do
  it { is_expected.to belong_to(:merchant) }
  it { is_expected.to belong_to(:shopper) }
end

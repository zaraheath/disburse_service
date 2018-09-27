# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shopper, 'validations', type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:nif) }
  it { is_expected.to validate_length_of(:nif) }
end

RSpec.describe Shopper, 'relations', type: :model do
  it { is_expected.to have_many(:orders) }
end

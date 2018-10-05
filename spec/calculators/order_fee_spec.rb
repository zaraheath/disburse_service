# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderFee, type: :calculator do
  describe 'calculate' do
    let(:merchant) { create(:merchant, :with_fees) }

    subject { described_class.new(merchant, amount).calculate }

    (1..49).to_a.each do |amount|
      context 'for small amounts' do
        let(:amount) { amount }
        it { expect(subject).to eq (amount * 0.01).round(2) }
      end
    end

    (50..300).to_a.each do |amount|
      context 'for medium amounts' do
        let(:amount) { amount }
        it { expect(subject).to eq (amount * 0.01).round(2) }
      end
    end
  end
end

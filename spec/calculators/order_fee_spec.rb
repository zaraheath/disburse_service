# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderFee, type: :calculator do
  describe 'calculate' do
    subject { described_class.new(amount).calculate }

    (1..49).to_a.each do |amount|
      context 'for small amounts' do
        let(:amount) { amount }
        it { expect(subject).to eq amount * OrderFee::FEES[:small_amount][:fee] }
      end
    end

    (50..300).to_a.each do |amount|
      context 'for medium amounts' do
        let(:amount) { amount }
        it { expect(subject).to eq amount * OrderFee::FEES[:medium_amount][:fee] }
      end
    end

    (301..500).to_a.each do |amount|
      context 'for high amounts' do
        let(:amount) { amount }
        it { expect(subject).to eq amount * OrderFee::FEES[:high_amount][:fee] }
      end
    end
  end
end

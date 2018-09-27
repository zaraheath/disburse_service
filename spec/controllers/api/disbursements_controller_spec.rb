# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DisbursementsController, type: :controller do
  describe '#index' do
    let(:merchant) { create(:merchant) }

    subject { get(:index, params: { merchant_id: merchant_id }, format: :json) }

    context 'when merchant does not exist' do
      let(:merchant_id) { 'fake' }

      it { expect(subject).to have_http_status :not_found }
    end

    context 'when merchant exists' do
      let(:merchant_id) { merchant.id }

      before do
        3.times do
          create(:disbursement, merchant: merchant)
        end
      end

      it { expect(subject).to have_http_status :ok }
      it { expect(JSON.parse(subject.body).count).to eq 3 }
    end
  end
end

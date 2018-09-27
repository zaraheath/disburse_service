# frozen_string_literal: true

class Api::V1::DisbursementsController < ApplicationController
  def index
    render json: search_disbursements, each_serializer: DisbursementSerializer
  end

  private

  def current_merchant
    @_merchant ||= Merchant.find_by(params[:merchant_id])
  end

  def search_disbursements
    scope = current_merchant.disbursements
    scope = scope.by_week(params[:week]&.to_time) if params[:week].present?
    scope
  end
end

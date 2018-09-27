# frozen_string_literal: true

class Api::V1::DisbursementsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: search_disbursements, each_serializer: DisbursementSerializer
  end

  private

  def current_merchant
    @_merchant ||= Merchant.find(params[:merchant_id])
  end

  def search_disbursements
    scope = current_merchant.disbursements
    scope = scope.by_week(week) if params[:week].present?
    scope
  end

  def week
    params[:week]&.to_time.beginning_of_week
  end

  def not_found
    head :not_found
  end
end

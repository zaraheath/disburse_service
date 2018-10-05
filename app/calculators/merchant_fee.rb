# frozen_string_literal: true

class MerchantFee
  attr_reader :merchant, :week

  def initialize(merchant, week = Time.now.beginning_of_week)
    @merchant = merchant
    @week = week
  end

  def calculate
    create_disbursement
  end

  def adjust!
    disbursement = merchant.disbursements.find_by(week: week)
    adjust_fee(disbursement)
  end

  private

  def orders_sum_fee
    orders.sum(:fee)
  end

  def orders
    merchant.orders.completed.where(completed_at: [week, week.end_of_week])
  end

  def adjust_fee(disbursement)
    return if orders_sum_fee == disbursement.fee

    create_disbursement(disbursement.fee - orders_sum_fee)
  end

  def create_disbursement(fee = orders_sum_fee)
    disbursement = merchant.disbursements.new(week: week, fee: fee)
    orders.each do |o|
      disbursement.disbursement_orders.new(order: o)
    end
    disbursement.save!
  end
end

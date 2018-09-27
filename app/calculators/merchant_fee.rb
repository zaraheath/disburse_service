# frozen_string_literal: true

class MerchantFee
  attr_reader :merchant

  def initialize(merchant)
    @merchant = merchant
  end

  def calculate
    merchant.disbursements.create(week: week, fee: orders_sum_fee)
  end

  private

  def orders_sum_fee
    merchant.orders.completed.where(completed_at: [Time.now.last_week, Time.now]).sum(:fee)
  end

  def week
    Time.now.beginning_of_week
  end
end

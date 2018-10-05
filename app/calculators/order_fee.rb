# frozen_string_literal: true

class OrderFee
  attr_reader :amount, :merchant

  def initialize(merchant, amount)
    @amount = amount
    @merchant = merchant
  end

  def calculate
    sum = 0
    merchant.fees.where("min <= ? AND max >= ?", amount, amount).each do |fee|
      sum += amount * fee.fee
    end
    sum.round(2)
  end
end

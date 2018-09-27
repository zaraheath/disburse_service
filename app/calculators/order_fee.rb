# frozen_string_literal: true

class OrderFee
  attr_reader :amount

  FEES = {
    small_amount: { amount: 50, fee: 0.01 },
    medium_amount: { amount: 301, fee: 0.0095 },
    high_amount: { fee: 0.0085 }
  }.freeze

  def initialize(amount)
    @amount = amount
  end

  def calculate
    return small_amount_fee if small_amount_fee?
    return medium_amount_fee if medium_amount_fee?

    high_amount_fee
  end

  private

  [:small_amount, :medium_amount].each do |fee_amount|
    define_method "#{fee_amount}_fee?" do
      amount < FEES[fee_amount][:amount]
    end

    define_method "#{fee_amount}_fee" do
      amount * FEES[fee_amount][:fee]
    end
  end

  def high_amount_fee
    amount * FEES[:high_amount][:fee]
  end
end

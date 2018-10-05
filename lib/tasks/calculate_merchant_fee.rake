# frozen_string_literal: true

task calculate_merchant_fee: :environment do
  Merchant.includes(:orders).find_in_batches do |merchant|
    MerchantFee.new(merchant).calculate
  end
end

task adjust_merchant_fee: :environment do
  Merchant.includes(:orders).find_in_batches do |merchant|
    MerchantFee.new(merchant).adjust!
  end
end


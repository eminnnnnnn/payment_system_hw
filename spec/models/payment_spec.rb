require 'rails_helper'

RSpec.describe Payment, type: :model do
  context "validatiot tests" do
    it "should don't save uncorrect payments" do
      expect(Payment.new(payment_type: "mobile", payment_account: 89886762367, user_id: 1).save).to eq(false)
      expect(Payment.new(payment_type: "mobile", payment_account: 89886762367, payment_summa: 300).save).to eq(false)
      expect(Payment.new(payment_type: "mobile", payment_summa: 300, user_id: 1).save).to eq(false)
      expect(Payment.new(payment_account: 89886762367, payment_summa: 300, user_id: 1).save).to eq(false)
      expect(Payment.new(payment_type: "mobile", payment_account: 8988, payment_summa: 300, user_id: 1).save).to eq(false)
      expect(Payment.new(payment_type: "mobile", payment_account: 89886762367, payment_summa: 300000, user_id: 1).save).to eq(false)
      expect(Payment.new(payment_type: "mobile", payment_account: "asd", payment_summa: 300, user_id: 1).save).to eq(false)
    end
    it "should save successfully" do
      expect(Payment.new(payment_type: "mobile", payment_account: 89886762367, payment_summa: 300, user_id: 1).save).to eq(true)
    end
  end
end

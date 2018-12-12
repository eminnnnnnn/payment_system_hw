class Payment < ApplicationRecord
  validates :payment_type, :payment_account, :payment_summa, :payment_status, :cashback, presence: true
  validates :payment_summa, length: { minimum: 1, maximum: 5 }
  validates :payment_summa, numericality: { greater_than_or_equal_to: 0.01 }
  validates :payment_account, length: { minimum: 11, maximum: 23 }
  has_one :user
end

FactoryBot.define do
  factory :payment do
      payment_type { "mobile" }
      payment_account { 89295666776 }
      payment_summa { 400 }
      payment_status { "PAID" }
      cashback { 6 }
      user_id { 1 }
  end
  factory :user do
    email { "coco_j@mbo.ru" }
    password { 'yayacocojambo' }
  end
end

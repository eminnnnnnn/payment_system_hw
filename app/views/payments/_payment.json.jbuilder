json.extract! payment, :id, :payment_type, :payment_account, :payment_summa, :payment_status, :cashback, :created_at, :updated_at
json.url payment_url(payment, format: :json)

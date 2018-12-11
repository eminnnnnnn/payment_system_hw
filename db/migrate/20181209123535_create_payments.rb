class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :payment_type
      t.integer :payment_account
      t.integer :payment_summa
      t.string :payment_status
      t.integer :cashback

      t.timestamps
    end
  end
end

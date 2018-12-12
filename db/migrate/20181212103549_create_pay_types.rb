class CreatePayTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pay_types do |t|
      t.string :type_of_payment
      t.string :type_of_account
      t.timestamps
    end
  end
end

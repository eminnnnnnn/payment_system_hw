class AddBalanceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_balance, :integer
  end
end

class AddUserInterestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_interest, :string
  end
end

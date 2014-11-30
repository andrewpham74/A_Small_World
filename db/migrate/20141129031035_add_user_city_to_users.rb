class AddUserCityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_city, :string
  end
end

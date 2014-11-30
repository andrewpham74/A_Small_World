class AddUserCountrynameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_countryname, :string
  end
end

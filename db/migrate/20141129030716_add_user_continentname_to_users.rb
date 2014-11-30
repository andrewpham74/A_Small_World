class AddUserContinentnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_continentname, :string
  end
end

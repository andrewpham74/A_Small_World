class ChangeCountriesToSeeToTextOnUsers < ActiveRecord::Migration
  def change
  	change_column :users, :countries_to_see, :text
  end
end

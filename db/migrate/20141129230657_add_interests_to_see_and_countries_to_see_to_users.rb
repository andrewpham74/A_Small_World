class AddInterestsToSeeAndCountriesToSeeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :countries_to_see, :string
  end
end

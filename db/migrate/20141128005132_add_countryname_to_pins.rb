class AddCountrynameToPins < ActiveRecord::Migration
  def change
    add_column :pins, :country, :string
  end
end

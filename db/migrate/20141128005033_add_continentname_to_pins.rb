class AddContinentnameToPins < ActiveRecord::Migration
  def change
    add_column :pins, :continent, :string
  end
end

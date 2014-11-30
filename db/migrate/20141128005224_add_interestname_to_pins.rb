class AddInterestnameToPins < ActiveRecord::Migration
  def change
    add_column :pins, :interest, :string
  end
end

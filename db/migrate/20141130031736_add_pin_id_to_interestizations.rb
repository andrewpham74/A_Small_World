class AddPinIdToInterestizations < ActiveRecord::Migration
  def change
    add_column :interestizations, :pin_id, :integer
  end
end

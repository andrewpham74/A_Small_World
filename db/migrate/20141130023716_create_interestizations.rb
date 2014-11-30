class CreateInterestizations < ActiveRecord::Migration
  def change
    create_table :interestizations do |t|
      t.belongs_to :interest
      t.belongs_to :user

      t.timestamps
    end

    add_index :interestizations, :interest_id
    add_index :interestizations, :user_id
  end
end

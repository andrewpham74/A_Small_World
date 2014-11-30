class Interest < ActiveRecord::Base
	has_many :interestizations
	has_many :users, through: :interestizations
	has_many :pins, through: :interestizations
end

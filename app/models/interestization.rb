class Interestization < ActiveRecord::Base
	belongs_to :interest
	belongs_to :user
	belongs_to :pin
end

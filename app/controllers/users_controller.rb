class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def create
		user = User.new(user_params)

		if user.save
			respond_to do |format|
				format.json { render json: user } 
			end
		else
			respond_to do |format|
				format.json { render json: { errors: user.errors }, status: 422 }
			end
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end

class UserSessionsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def create
		user = User.find_for_database_authentication(email: user_session_params[:email])

		if user
			sign_in("user", user)

			respond_to do |format|
				format.json { 
					render json: user
				}
			end
		else
			respond_to do |format|
				format.json { render nothing: true, status: 401 }
			end
		end
	end

	private

	def user_session_params
		params.require(:user_session).permit(:email, :password)
	end
end

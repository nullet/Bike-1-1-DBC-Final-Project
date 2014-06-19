class RegistrationsController < Devise::RegistrationsController



	private

	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :home_base, :karma_count, :hb_radius, :authentication_token)
	end

	def account_update_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :current_password, :phone, :home_base, :authentication_token)
	end
end

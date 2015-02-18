class OmniauthController < ApplicationController
		def create
			# Signup if needed
			user = User.from_omniauth(env["omniauth.auth"])

			# Log in
	    session[:user_id] = user.id

	    # Redirect
	    redirect_to "/events", notice: "You logged in!"

    end
    def destroy
	  	logout()
	  	redirect_to root_path
	  end

end

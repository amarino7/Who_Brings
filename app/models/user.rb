class User < ActiveRecord::Base
	has_secure_password
	has_many :events
	has_many :tasks

	def self.confirm(email_param, password_param)
		user = User.find_by({email: email_param})
		user.authenticate(password_param)
	end

	def self.from_omniauth(auth)
  	where(uid: auth.uid).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    # user.profile_image = auth.info.image
	    user.image = auth.info.image
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.save!(validate: false) # skip password validation
  	end
	end

end

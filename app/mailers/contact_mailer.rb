class ContactMailer < ApplicationMailer
	# Default Mail Values
	
	def contact(user)
	  @user = user
 	  mail(to: @user.email, subject: 'sujet simple')
	end
end

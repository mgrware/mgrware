class ConfirmationMailer < ApplicationMailer
	  def confirm_email(target_email, activation_token)
            @activation_token = activation_token
            mail(:to => target_email,
                 :from => "dont.reply.notifikasi@gmail.com",
                 :subject => "[Account Activation] Gilang.com") do |format|
                 			format.html { render 'confirm_email'}
                 end
      end
end

class UserMailer < ApplicationMailer
     default from: 'admin@example.com'
    def destroy_email(user)
        @user = user
        mail(to: @user.email, subject: 'Useer Destroy')
    end
end
class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t(".mail_activation")
  end

  def password_reset
    @greeting = t "account_activations.p_hi"
    mail to: "to@example.org"
  end
end

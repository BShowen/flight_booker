class PassengerMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.passenger_mailer.confirm_booking.subject
  #

  
  def confirm_booking
    @booking = params[:booking]
    email = params[:email]
    mail( to: email, subject: "Booking Confirmed" )
  end

  def test_emails(email)
    @booking = Booking.last
    mail( to: email, subject: "Booking Confirmed", template_name: "confirm_booking")
  end

end

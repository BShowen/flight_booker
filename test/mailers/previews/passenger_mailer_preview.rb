# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/passenger_mailer/confirm_booking
  def confirm_booking
    PassengerMailer.with(booking: Booking.last).confirm_booking
  end

  def test_booking
    PassengerMailer.test_email("foo bar")
  end

end

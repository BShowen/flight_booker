require 'test_helper'

class PassengerMailerTest < ActionMailer::TestCase
  test "ConfirmBooking" do
    mail = PassengerMailer.confirm_booking
    assert_equal "Confirmbooking", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

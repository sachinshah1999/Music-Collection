require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "email" do
    # Create the email and store it for further assertions
    email = ContactMailer.contact_email('sachin@example.com', 'Sachin Shah', '12345678910', 'This is a message')

    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end

    # Test the body of the sent email contains what we expect it to
    assert_equal ['from@example.com'], email.from
    assert_equal ['to@example.com'], email.to
  end
end

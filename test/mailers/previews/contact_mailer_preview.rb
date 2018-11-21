# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
    ContactMailer.contact_email("ss01703@surrey.ac.uk", "Sachin Shah", "123456789", "Hello")
  end

end

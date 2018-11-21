class ApplicationMailer < ActionMailer::Base
  default to: 'to@example.com', from: 'from@example.com'
  layout 'mailer'
end

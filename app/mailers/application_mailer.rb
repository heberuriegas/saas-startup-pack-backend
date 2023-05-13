class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name('noreply@ssp.com', 'Ssp')
  layout 'mailer'
end

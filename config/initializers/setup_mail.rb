ActionMailer::Base.smtp_settings = {
  :address  => "smtp.gmail.com",
  :port  => 587,
  :user_name  => "demotestinterview@gmail.com",
  :password  => "temp@123",
  :authentication  => :plain,
  :enable_starttls_auto => true
}
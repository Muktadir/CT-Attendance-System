ActionMailer::Base.smtp_settings = {
    :address              => "smtp.mandrillapp.com",
    :port                 => 587,
    :domain               => "www.coderstrust.com",
    :user_name            => "muktadir.shourov@gmail.com",
    :password             => "9StHiVO_xLpo76LMuI8qIg",
    :authentication       => "plain",
    :enable_starttls_auto => true
}
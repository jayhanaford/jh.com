# encoding: UTF-8
require "mango"
require "pony"

class Mango::Application
  set :theme, "jh"

  set :domain, "jayhanaford.com"

  Pony.options = {
    :to  => ENV["GMAIL_SMTP_DELIVER_TO"],
    :via => :smtp,
    :via_options => {
      :address              => "smtp.gmail.com",
      :port                 => "587",
      :enable_starttls_auto => true,
      :user_name            => ENV["GMAIL_SMTP_USERNAME"],
      :password             => ENV["GMAIL_SMTP_PASSWORD"],
      :authentication       => :plain,
      :domain               => settings.domain
    }
  }

  post "/contact" do
    begin
      Pony.mail(:subject => "New message from #{request.url}", :body => erb(:contact))
    rescue Exception => e
      warn "#{e.class} - #{e.message}"
      halt "failure"
    end

    "success"
  end
end

run Mango::Application

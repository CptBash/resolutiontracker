if Rails.env.production?
  config_path = File.expand_path(Rails.root.to_s + '/config/mailer.yml')
  if File.exists? config_path
    ENV.update YAML.load_file(config_path)[Rails.env]
  end

  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV["SENDGRID_USERNAME"],
    :password       => ENV["SENDGRID_PASSWORD"],
    :domain         => "yourdomain",
  }
end

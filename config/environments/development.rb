Koi2::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  #config.assets.debug = true
  
  
  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
  
  config.action_mailer.default_url_options = { :host => 'koi.herokuapp.com' }
	# ActionMailer Config
	# Setup for production - deliveries, no errors raised
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.perform_deliveries = true
	config.action_mailer.raise_delivery_errors = true  #normally false for production
	config.action_mailer.default :charset => "utf-8"
	# ActionMailer Config
	# Setup for production - deliveries, no errors raised
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.perform_deliveries = true
	config.action_mailer.raise_delivery_errors = true
	config.action_mailer.default :charset => "utf-8"
	
	
		config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
		:address => 'box662.bluehost.com',
		:port => 26,
		:domain => ENV['GMAIL_SMTP_DOMAIN'],
		:user_name => ENV['GMAIL_SMTP_USER'],
		:password => ENV['GMAIL_SMTP_PASSWORD'],
		:authentication => 'plain',
		:openssl_verify_mode => 'none',
		:enable_starttls_auto => false
	}
	

		
end

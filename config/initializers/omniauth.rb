Rails.application.config.middleware.insert_before ActionDispatch::Static, OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, Rails.application.credentials[:twitter_api_key], Rails.application.credentials[:twitter_api_secret]
end

OmniAuth.config.logger = Rails.logger

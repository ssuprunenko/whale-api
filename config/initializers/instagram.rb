Instagram.configure do |config|
  config.access_token  = ENV['INSTAGRAM_ACCESS_TOKEN']
  config.client_id     = ENV['INSTAGRAM_CLIENT_ID']
  config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
  config.redirect_uri  = ENV['INSTAGRAM_REDIRECT_URI']
end

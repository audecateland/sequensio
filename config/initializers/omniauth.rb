require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['RSPOTIFY_CLIENT_ID'], ENV['RSPOTIFY_CLIENT_SECRET'], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end

OmniAuth.config.allowed_request_methods = [:post, :get]

require 'twitter'
require 'dotenv'
Dotenv.load

class BotTwitter
# quelques lignes qui enregistrent les clés d'APIs
  def perform
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["API_KEY"]
      config.consumer_secret     = ENV["API_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["TOKEN_SECRET"]
    end
  return @client
  end
  def update
    client.update("Ton message")
  end
end
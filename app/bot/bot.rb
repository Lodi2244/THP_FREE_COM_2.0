require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN_MESSENGER"])

Bot.on :message do |message|
  message.reply(text: 'Hello, human!')
end
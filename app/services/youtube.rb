require 'watir'
require 'watir-scroll'
require 'dotenv'
Dotenv.load('../../.env')

client = Selenium::WebDriver::Remote::Http::Default.new
client.open_timeout = 1000
p client.open_timeout # seconds – default is 60
client.read_timeout = 1000
p client.read_timeout
username = ENV['USER_NAME']
password = ENV['PASSWORD']
array = ["Etudiant", "Chomeur", "Education"]

# Login
browser = Watir::Browser.new :chrome, :http_client => client
browser.goto('https://accounts.google.com/signin/v2/identifier?passive=true&continue=https%3A%2F%2Fwww.youtube.com%2Fsignin%3Faction_handle_signin%3Dtrue%26app%3Ddesktop%26next%3D%252F%253Fgl%253DFR%2526hl%253Dfr%26hl%3Den&service=youtube&uilel=3&hl=en&flowName=GlifWebSignIn&flowEntry=ServiceLogin')
browser.element(id: "identifierId").send_keys(username)
browser.element(id: "identifierNext").click
browser.scroll.to :center
browser.input(:type => "password").send_keys(password)
browser.element(id: "passwordNext").click

# Search
array.each do |ele|
	browser.element(id: "search").send_keys(ele)
	browser.element(id: "search-icon-legacy").click

	i = 1
	k = 100
	while i <= 4
		browser.scroll.to(:bottom).by(0 + k, 250 + k)
		lien = 'ytd-video-renderer.style-scope:nth-child('+i.to_s+') > div:nth-child(1) > ytd-thumbnail:nth-child(1) > a:nth-child(1) > yt-img-shadow:nth-child(1) > img:nth-child(1)'
		browser.element(css: lien).click
		browser.scroll.to(:bottom).by(0, 500)
		browser.scroll.to(:bottom).by(0, 500)
		browser.element(id: "placeholder-area").click
		browser.element(id: "contenteditable-textarea").send_keys("Venez apprendre à coder chez [The hacking project]")
		browser.element(id: "submit-button").click
		browser.back
		k = k + 100
		i = i + 1
	end
	browser.back
	browser.back
end

sleep(30)
browser.quit

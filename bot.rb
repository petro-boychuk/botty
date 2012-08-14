class Bot

  require 'mechanize'

  def connect

    agent = Mechanize.new

    res = agent.post "http://www.emp-game.com/Account/LogOn", :Password => "qwerty", :Email => "taras.bober@gmail.com"
    reg = /window\.localStorage\.setItem\(\'session\-id\', \'([a-zA-Z0-9]*)\'\);/
    session_id = reg.match(res.body)[1]

    res = agent.post "http://ua1.emp-game.com/service/", :method => "render-start-info", "session-id" => session_id
    puts res.body

    #site = RestClient::Resource.new "http://www.emp-game.com"
    #res = site['Account/LogOn'].post :Password => "qwerty", :Email => "taras.bober@gmail.com" do |response, request, result|
    #  site['service/'].post :method => "render-start-info" do |response, request, result|
    #    puts response
    #  end
    #end

  end

end

bot = Bot.new
bot.connect
require 'mechanize'
require 'json'

class Botty
  class Connection

    attr_accessor :agent
    attr_accessor :session_id

    attr_accessor :email, :password, :username


    def initialize email, password
      @email = email
      @password = password
      @username = nil
    end

    def connect
      @agent = Mechanize.new
      res = agent.post "http://www.emp-game.com/Account/LogOn", :Password => @password, :Email => "taras.bober@gmail.com"
      session_id_regexp = /window\.localStorage\.setItem\(\'session\-id\', \'([a-zA-Z0-9]*)\'\);/

      @session_id = session_id_regexp.match(res.body)[1]
      @username = ""
    end

    def status
      res = @agent.post "http://ua1.emp-game.com/service/", :method => "render-start-info", "session-id" => @session_id
      res.body
      JSON.parse(res.body)
    end

    #TODO: Write methods to get game information and process actions
  end
end
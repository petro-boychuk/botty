require "./connection"
class Botty

  class Bot

    attr_accessor :connection

    def initialize connection
      @connection = connection
    end

    def start
      @connection.connect

      puts @connection.status
    end
  end

end


connection = Botty::Connection.new "taras.bober@gmailcom", "qwerty"
bot = Botty::Bot.new connection
bot.start
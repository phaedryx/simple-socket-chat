require 'cramp'

Cramp::Websocket.backend = :thin

module Chat
  class IndexAction < Cramp::Action
    def start
      render File.read('index.html')
      finish
    end
  end

  class UserSocket < Cramp::Websocket
    @@users = []

    on_start :connect_user
    on_finish :disconnect_user
    on_data :echo

    def connect_user
      @@users << self
    end

    def disconnect_user
      @@users.delete(self)
    end

    def echo(data)
      @@users.each {|u| u.render data }
    end
  end
end

module MessageRocket
  class Client
    def initialize
      uri     = ENV.fetch('MESSAGEROCKET_URL')
      secret  = ENV.fetch('MESSAGEROCKET_SKEY')

      Faye.ensure_reactor_running!
      @client = Faye::Client.new uri
      @client.add_extension SecretKeyExtension.new secret

    rescue KeyError
      msg = "MessageRocket ENV variables not found\n\n"
      msg << "In order to use the message_rocket gem you need to have both the"
      msg << "MESSAGEROCKET_URL and MESSAGEROCKET_PKEY environment variables set."
      msg << "Usually you get this by adding the `messagerocket` add on to your"
      msg << "app in Heroku."

      raise RuntimeError, msg
    end

    def subscribe channel, &block
      @client.subscribe channel, &block
    end

    def publish channel, message
      @client.publish channel, message
    end
  end
end

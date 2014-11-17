require 'faye'

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
      msg << "MESSAGEROCKET_URL and MESSAGEROCKET_SKEY environment variables set."
      msg << "Usually you get this by adding the `messagerocket` add on to your"
      msg << "app in Heroku."

      raise RuntimeError, msg
    end

    # Subscribe to an arbitrary channel.  The provided block is called with
    # each message received as it's argument.
    def subscribe channel, &block
      @client.subscribe channel, &block
    end

    # Unsubscribe from a channel.
    def unsubscribe channel
      @client.unsubscribe channel
    end

    # Publish a message to an arbitrary channel.
    def publish channel, message
      raise ArgumentError, "Message must respond to `to_h`" unless message.respond_to? :to_h
      @client.publish channel, message
    end
  end
end

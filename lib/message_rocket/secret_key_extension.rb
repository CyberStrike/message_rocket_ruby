module MessageRocket
  class SecretKeyExtension
    def initialize secret
      @secret = secret
    end

    def inbound message, callback
      callback.call message
    end

    def outgoing message, callback
      message['ext'] ||= {}
      message['ext']['secret_key'] = @secret
      callback.call message
    end
  end
end

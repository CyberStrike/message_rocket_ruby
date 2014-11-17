module MessageRocket
  class SubscriptionRequest < Request

    def permit permissions=:read_write
      respond_with PermitResponse.new(self, permissions)
    end

    def deny message="Subscription denied"
      respond_with DenyResponse.new(self, message)
    end

    private

    def respond_with response
      response = response.to_h
      client.publish SIGNALLING_CHANNEL, response
      nil
    end

    def client
      @client ||= MessageRocket.client
    end

  end
end

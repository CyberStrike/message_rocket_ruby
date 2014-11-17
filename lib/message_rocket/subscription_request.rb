module MessageRocket
  class SubscriptionRequest < Request

    def permit
      respond_with PermitResponse.new(self)
    end

    def deny
      respond_with DenyResponse.new(self)
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

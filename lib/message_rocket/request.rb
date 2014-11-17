module MessageRocket
  class Request

    class << self
      def from_message message
        return unless message['request']

        case message['request']['requestType']
        when 'subscription'
          SubscriptionRequest.new message['request']
        end
      end
    end

    def initialize request
      @request = request
    end

    def id
      @request['id']
    end

    def client_id
      @request['client_id']
    end

    def channel
      @request['channel']
    end

    def client_auth
      @request['client_auth']
    end

  end
end

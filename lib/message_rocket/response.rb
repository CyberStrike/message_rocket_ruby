module MessageRocket
  class Response

    def initialize request
      @request = request
    end

    def id
      @request.id
    end

    def response_type
      raise RuntimeError, "Implement me in your subclass."
    end

    def to_h
      {
        response: {
          id:           id,
          responseType: response_type
        }
      }
    end
  end
end

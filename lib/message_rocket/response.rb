module MessageRocket
  class Response

    def initialize request, options
      @request = request
      @options = options
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
        }.tap do |r|
          r[:options] = @options if @options
        end
      }
    end
  end
end

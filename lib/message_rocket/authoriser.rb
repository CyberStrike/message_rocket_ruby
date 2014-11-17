module MessageRocket
  class Authoriser

    def initialize block
      @block = block
      client.subscribe SIGNALLING_CHANNEL do |message|
        incoming_request message
      end
    end

    private

    attr_reader :block

    def client
      @client ||= MessageRocket.client
    end

    def incoming_request message
      request = Request.from_message message
      return unless request
      block.call request
      nil
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
      e.backtrace.each do |l|
        puts l
      end
    end

  end
end

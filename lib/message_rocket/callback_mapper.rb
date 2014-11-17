module MessageRocket
  class CallbackMapper

    def on_subscription_request &block
      Authoriser.new block
    end

  end
end

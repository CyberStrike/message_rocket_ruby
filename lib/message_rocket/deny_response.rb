module MessageRocket
  class DenyResponse < Response
    def response_type
      'deny'
    end
  end
end

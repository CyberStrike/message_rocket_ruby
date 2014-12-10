module MessageRocket
  class PermitResponse < Response
    PERMISSIONS = %w| read_write read_only write_only |.map(&:to_sym)

    def initialize request, options
      raise ArgumentError, "Invalid permission argument: must be one of #{PERMISSIONS.map(&:inspect).join(', ')}" unless PERMISSIONS.member? options
      super
    end

    def response_type
      'permit'
    end
  end
end

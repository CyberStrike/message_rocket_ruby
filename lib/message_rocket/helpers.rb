module MessageRocket
  module Helpers
    def message_rocket_link_tag
      message_rocket_public_key_meta_tag +
        message_rocket_uri_meta_tag +
        message_rocket_javascript_tag
    end

    def message_rocket_public_key_meta_tag
      "<meta name=\"messagerocket-public-key\" value=\"#{ENV['MESSAGEROCKET_PKEY']}\">"
    end

    def message_rocket_uri_meta_tag
      "<meta name=\"messagerocket-uri\" value=\"#{ENV['MESSAGEROCKET_URL']}\">"
    end

    def message_rocket_javascript_tag
      "<script src=\"https://messagerocket.co/messagerocket.js\"></script>"
    end
  end
end

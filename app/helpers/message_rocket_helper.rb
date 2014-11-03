module MessageRocketHelper
  def message_rocket_link_tag
    message_rocket_public_key_meta_tag +
      message_rocket_uri_meta_tag +
      message_rocket_javascript_tag
  end

  def message_rocket_public_key_meta_tag
    tag :meta, name: "messagerocket-public-key", value: ENV['MESSAGEROCKET_PKEY']
  end

  def message_rocket_uri_meta_tag
    tag :meta, name: "messagerocket-uri", value: ENV['MESSAGEROCKET_URL']
  end

  def message_rocket_javascript_tag
    javascript_include_tag 'https://messagerocket.co/messagerocket.js'
  end
end

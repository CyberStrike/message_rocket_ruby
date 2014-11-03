require "message_rocket/version"

module MessageRocket

  autoload :Client,             File.expand_path('../message_rocket/client.rb', __FILE__)
  autoload :SecretKeyExtension, File.expand_path('../message_rocket/secret_key_extension.rb', __FILE__)

  Engine = Class.new Rails::Engine if defined? Rails::Engine
end

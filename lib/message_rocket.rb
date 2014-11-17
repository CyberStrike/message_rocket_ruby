require "message_rocket/version"

module MessageRocket

  SIGNALLING_CHANNEL = '/__signalling__'

  autoload :Client,              File.expand_path('../message_rocket/client.rb', __FILE__)
  autoload :SecretKeyExtension,  File.expand_path('../message_rocket/secret_key_extension.rb', __FILE__)
  autoload :Request,             File.expand_path('../message_rocket/request.rb', __FILE__)
  autoload :SubscriptionRequest, File.expand_path('../message_rocket/subscription_request.rb', __FILE__)
  autoload :Response,            File.expand_path('../message_rocket/response.rb', __FILE__)
  autoload :PermitResponse,      File.expand_path('../message_rocket/permit_response.rb', __FILE__)
  autoload :DenyResponse,        File.expand_path('../message_rocket/deny_response.rb', __FILE__)
  autoload :Authoriser,          File.expand_path('../message_rocket/authoriser.rb', __FILE__)
  autoload :CallbackMapper,      File.expand_path('../message_rocket/callback_mapper.rb', __FILE__)

  Engine = Class.new Rails::Engine if defined? Rails::Engine

  module_function

  def client
    Client.new
  end

  def on request_type, &block
    CallbackMapper.new.public_send "on_#{request_type}", &block
  end

end

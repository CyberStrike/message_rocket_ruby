require "message_rocket/version"

module MessageRocket
  Engine = Class.new Rails::Engine if defined? Rails::Engine
end

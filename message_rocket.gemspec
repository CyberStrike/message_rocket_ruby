# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'message_rocket/version'

Gem::Specification.new do |spec|
  spec.name          = "message_rocket"
  spec.version       = MessageRocket::VERSION
  spec.authors       = ["James Harton"]
  spec.email         = ["james@resistor.io"]
  spec.summary       = %q{MessageRocket client library}
  spec.description   = <<-EOF
  MessageRocket (messagerocket.co) is a realtime websocket add-on for Heroku
  providing pub/sub messaging.
  This gem provides the `message_rocket_link_tags` helper which automatically
  loads the MessageRocket client side JavaScript library.
  EOF
  spec.homepage      = "http://messagerocket.co/ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end

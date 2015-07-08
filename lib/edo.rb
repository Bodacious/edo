require "edo/version"
if defined?(Rails)
  require 'edo/railtie'
else
  warn "Edo is currently configured for Rails projects."
end


module Edo
  # Your code goes here...
end

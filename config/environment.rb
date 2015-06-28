# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

require 'magic_multi_connections'

module Calibre
	  establish_connection :calibre
end

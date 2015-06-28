class Book < ActiveRecord::Base
	establish_connection Rails.configuration.database_configuration["calibre"]
end

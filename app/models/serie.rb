class Serie < ActiveRecord::Base
	establish_connection Rails.configuration.database_configuration["calibre"]
	
	has_many :book_serie_link, foreign_key: "series"
	has_many :books, through: :book_serie_link
end

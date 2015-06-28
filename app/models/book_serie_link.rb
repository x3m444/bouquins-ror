class BookSerieLink < ActiveRecord::Base
	establish_connection Rails.configuration.database_configuration["calibre"]

	self.table_name =  "books_series_link"

	belongs_to :book, foreign_key: "book"
	belongs_to :serie, foreign_key: "series"
end

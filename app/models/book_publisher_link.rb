class BookPublisherLink < ActiveRecord::Base
	establish_connection Rails.configuration.database_configuration["calibre"]

	self.table_name = "books_publishers_link"

	belongs_to :book, foreign_key: "book"
	belongs_to :publisher, foreign_key: "publisher"
end

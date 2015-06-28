class Publisher < ActiveRecord::Base
	establish_connection Rails.configuration.database_configuration["calibre"]

	has_many :book_publisher_link, foreign_key: "publishers"
	has_many :books, through: :book_publisher_link
end

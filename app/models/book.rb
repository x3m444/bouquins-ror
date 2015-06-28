class Book < ActiveRecord::Base
	establish_connection Rails.configuration.database_configuration["calibre"]

	has_and_belongs_to_many :authors,
		join_table: "books_authors_link",
		foreign_key: "book",
		association_foreign_key: "author"
	has_one :book_serie_link, foreign_key: "book"
	has_one :serie, through: :book_serie_link
end

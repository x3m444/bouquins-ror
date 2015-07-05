class Book < ActiveRecord::Base
	establish_connection Rails.configuration.database_configuration["calibre"]

	has_and_belongs_to_many :authors,
		join_table: "books_authors_link",
		foreign_key: "book",
		association_foreign_key: "author"
	has_and_belongs_to_many :tags,
		join_table: "books_tags_link",
		foreign_key: "book",
		association_foreign_key: "tag"
	has_and_belongs_to_many :languages,
		join_table: "books_languages_link",
		foreign_key: "book",
		association_foreign_key: "lang_code"

	has_one :book_publisher_link, foreign_key: "book"
	has_one :publisher, through: :book_publisher_link

	has_one :book_serie_link, foreign_key: "book"
	has_one :serie, through: :book_serie_link

	has_many :data, class_name: "BookDataLink", foreign_key: "book"

	def has_cover?
		has_cover == 1
	end
end

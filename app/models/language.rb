class Language < ActiveRecord::Base
	establish_connection Rails.configuration.database_configuration["calibre"]

	has_and_belongs_to_many :books,
		join_table: "books_languages_link",
		foreign_key: "lang_code",
		association_foreign_key: "book"
end

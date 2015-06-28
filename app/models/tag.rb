class Tag < ActiveRecord::Base
	establish_connection Rails.configuration.database_configuration["calibre"]

	has_and_belongs_to_many :books,
		join_table: "books_tags_link",
		foreign_key: "tag",
		association_foreign_key: "book"
end

class AuthorsController < ApplicationController
	include PreferencesHelper

	before_action :preferences, only: :index

	def show
		@author = Author.find(params[:id])
		@title = @author.name
		@tabs = [
			{ action: :titles, label: "Titles", active: true, icon: "book" },
			{ action: :series, label: "Series", active: false, icon: "list" },
			{ action: :authors, label: "Co-Authors", active: false, icon: "user" },
		]
		# active tab
		titles
	end

	def index
		@authors = Author.where(query_filter)
			.order(:sort)
			.paginate(pagination)
		@title = t(:authors)
		respond_to do |format|
			format.html 
			format.js
		end
	end

	def titles
		@author = Author.find(params[:id])
		@books = @author.books.sort{|b1,b2|b1.sort <=> b2.sort}
		respond_to do |format|
			format.html 
			format.js
		end
	end

	def series
		@author = Author.find(params[:id])
		respond_to do |format|
			format.html 
			format.js
		end
	end

	def authors
    @authors = Author.find_by_sql(["select distinct a.* from books_authors_link bal1 left outer join books_authors_link bal2 on bal1.book = bal2.book left outer join authors a on a.id = bal2.author where bal1.author = ? and bal2. author != ?", params[:id], params[:id]])
		respond_to do |format|
			format.html 
			format.js
		end
	end

end

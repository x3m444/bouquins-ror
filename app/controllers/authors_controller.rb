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
		@authors = Author.where(query_filter).order(:sort)
			.paginate(page: params[:page], per_page: @preference.per_page)
		@title = "Authors"
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
		@author = Author.find(params[:id])
		@authors = Array.new
		@author.books.each do |b|
			@authors.concat b.authors
		end
		@authors.uniq!
		@authors.select! {|a| a != @author}
		respond_to do |format|
			format.html 
			format.js
		end
	end

end

class BooksController < ApplicationController
	include PreferencesHelper
	include ERB::Util

	before_action :preferences, only: :index

	def show
		@book = Book.find(params[:id])
		@title = @book.title
	end

	def index
		@books = Book .where(query_filter(Book.table_name))
			.includes(:authors, :serie) .references(:authors, :serie)
			.order(sort_col)
			.paginate(pagination)
		@title = t(:books)
		respond_to do |format|
			format.html 
			format.js
		end
	end

	def cover
		@book = Book.find(params[:id])
		redirect_to "/calibre/#{url_encode(@book.path)}/cover.jpg"
	end

	private
	def sort_col
		if @preference.sort == "latest"
			return { last_modified: :desc }
		end
		:sort
	end

end

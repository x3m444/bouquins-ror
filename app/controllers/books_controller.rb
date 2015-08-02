class BooksController < ApplicationController
	include PreferencesHelper
	include ERB::Util

	before_action :preferences, only: :index

	def show
		@book = Book.find(params[:id])
		@title = @book.title
	end

	def index
		@books = Book.where(initial_filter).order(sort_col)
			.paginate(page: params[:page], per_page: session[:current_per_page])
		@title = "Books"
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
		if session[:sort] == "latest"
			return { last_modified: :desc }
		end
		:sort
	end

end

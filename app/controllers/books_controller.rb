class BooksController < ApplicationController
	include PreferencesHelper

	before_action :preferences, only: :index

	def show
		@book = Book.find(params[:id])
		@title = @book.title
	end

	def index
		@books = Book.where(initial_filter).order(:sort)
			.paginate(page: params[:page], per_page: session[:current_per_page])
		@title = "Books"
		respond_to do |format|
			format.html 
			format.js
		end
	end

end

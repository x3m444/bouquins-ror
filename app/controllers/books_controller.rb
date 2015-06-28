class BooksController < ApplicationController

	def show
		@book = Book.find(params[:id])
	end

	def index
		@books = Book.paginate(page: params[:page])
	end

end

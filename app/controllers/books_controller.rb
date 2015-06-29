class BooksController < ApplicationController

	def show
		@book = Book.find(params[:id])
		@title = @book.title
	end

	def index
		@books = Book.paginate(page: params[:page])
		@title = "Books"
		respond_to do |format|
			format.html 
			format.js
		end
	end

end

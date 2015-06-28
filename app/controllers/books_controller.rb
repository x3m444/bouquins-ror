class BooksController < ApplicationController

	def show
		@book = Calibre::Book.find(params[:id])
	end

end

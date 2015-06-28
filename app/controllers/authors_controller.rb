class AuthorsController < ApplicationController

	def show
		@author = Author.find(params[:id])
		@title = @author.name
	end

	def index
		@authors = Author.paginate(page: params[:page])
		@title = "Authors"
	end

end

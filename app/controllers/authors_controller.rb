class AuthorsController < ApplicationController

	def show
		@author = Author.find(params[:id])
		@title = @author.name
	end

	def index
		@authors = Author.paginate(page: params[:page])
		@title = "Authors"
		respond_to do |format|
			format.html 
			format.js
		end
	end

end

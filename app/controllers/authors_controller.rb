class AuthorsController < ApplicationController
	include PreferencesHelper

	before_action :preferences, only: :index

	def show
		@author = Author.find(params[:id])
		@title = @author.name
	end

	def index
		@authors = Author.where(initial_filter).order(:sort)
			.paginate(page: params[:page], per_page: session[:current_per_page])
		@title = "Authors"
		respond_to do |format|
			format.html 
			format.js
		end
	end

end

class SeriesController < ApplicationController
	include PreferencesHelper

	before_action :preferences, only: :index

	def show
		@serie = Serie.find(params[:id])
		@title = @serie.name
	end

	def index
		@series = Serie.where(query_filter).order(:sort)
			.paginate(page: params[:page], per_page: @preference.per_page)
		@title = "Series"
		respond_to do |format|
			format.html 
			format.js
		end
	end

end

class SeriesController < ApplicationController

	def show
		@serie = Serie.find(params[:id])
		@title = @serie.name
	end

	def index
		@series = Serie.paginate(page: params[:page])
		@title = "Series"
	end

end

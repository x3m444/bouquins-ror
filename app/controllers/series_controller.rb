class SeriesController < ApplicationController
	include PreferencesHelper

	before_action :preferences, only: :index

	def show
		@serie = Serie.includes(books: :authors).references(:book).find(params[:id])
		@title = @serie.name
	end

	def index
		@series = Serie.where(query_filter(Serie.table_name))
			.includes(books: :authors)
			.references(:books)
			.order(:sort)
			.paginate(pagination)
		@title = t(:series)
		respond_to do |format|
			format.html 
			format.js
		end
	end

end

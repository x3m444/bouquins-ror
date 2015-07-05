class DataController < ApplicationController
	include ERB::Util

	def show
		d = BookDataLink.find_by(book: params[:id], format: params[:data_format])
		redirect_to "/calibre/#{url_encode(d.book.path)}/#{url_encode(d.name)}.#{d.format.downcase}"
	end

end

module PreferencesHelper

	# filter data on first letter
	def initial_filter
		["UPPER(sort) LIKE ?", session[:initial] + "%"] if session[:initial]
	end

	# update preferences (per_page, initial, sort)
	def preferences
		session[:current_per_page] = params[:per_page] ? params[:per_page].to_i : (session[:current_per_page] || WillPaginate.per_page)
		if params[:initial] 
			session[:initial] = (params[:initial] == "reset" ? nil : params[:initial])
		end
		session[:sort] = params[:sort]
	end

end

module PreferencesHelper

	# filter data on first letter
	def initial_filter
		["UPPER(sort) LIKE ?", session[:initial] + "%"] if session[:initial]
	end

	# update preferences (per_page, initial)
	def preferences
		session[:current_per_page] = params[:per_page] ? params[:per_page].to_i : (session[:current_per_page] || WillPaginate.per_page)
		if params[:initial] 
			session[:initial] = (session[:initial] == params[:initial] ? nil : params[:initial])
		end
	end

end

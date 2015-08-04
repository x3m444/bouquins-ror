module PreferencesHelper

	# update preferences (per_page, initial, sort)
	def preferences
		@preference = Preference.new
		puts session[:preference]
		@preference.from_json(session[:preference].to_s) if session[:preference]
		p @preference
		if params[:initial] 
			@preference.initial = (params[:initial] == "reset" ? nil : params[:initial])
		end
		@preference.per_page = params[:per_page] ? params[:per_page].to_i : (@preference.per_page || WillPaginate.per_page)
		@preference.sort = params[:sort] if params[:sort]
		@preference.term = params[:term] if params[:term]
		puts @preference.as_json
		puts @preference.to_json
		session[:preference] = @preference.to_json
	end

	def query_filter
		conditions = Array.new
		params = Array.new
		if @preference.initial
			conditions.push "UPPER(sort) LIKE ?"
			params.push "#{@preference.initial}%"
		end
		if @preference.term
			conditions.push "sort LIKE ?"
			params.push "%#{@preference.term}%"
		end
		[ conditions.join(" AND ") ] + params
	end

end

class Preference 
	include ActiveModel::Serializers::JSON
	extend ActiveModel::Naming

	attr_accessor :sort, :term, :per_page, :initial

	def attributes=(hash)
		hash.each do |key, value|
			send("#{key}=", value)
		end
	end

	def attributes
		instance_values
	end
end

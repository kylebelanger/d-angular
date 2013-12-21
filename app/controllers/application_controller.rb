class ApplicationController < ActionController::Base

	protect_from_forgery

	def index
		render layout: "application", template: "index"
	end


	#def search
	#	@result = [{ keyOne: "testing the hash", keyTwo: "this is value two", textPro: [] }, 
	#				{ keyOne: "this is value one", keyTwo: "this is value two", textPro: [] },
	#				{ keyOne: "third hash", keyTwo: "this is value two", textPro: [] }]
		
	#	render layout: "application", template: "search"
	#end

end



















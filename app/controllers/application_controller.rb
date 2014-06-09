class ApplicationController < ActionController::Base

	protect_from_forgery

	def index
		render layout: "application", template: "index"
		@word = Word.new(:word => params[:word])

	end

end



















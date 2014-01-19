class WordsController < ApplicationController

	def index
	end

	def create
		@word = Word.search(params[:search])
			render layout: "application", template: "experiment"
	end

	def destroy
	end

end

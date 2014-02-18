class WordsController < ApplicationController

	def index
	end

	def create
		@word = Word.search(params[:search])
			render layout: "application", template: "words"
	end

	def destroy
	end

end

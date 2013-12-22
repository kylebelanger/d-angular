class WordsController < ApplicationController

	def index
	end

	def search
		@word = Word.search(params[:search])
			render layout: "application", template: "words"
	end

	def destroy
	end

end

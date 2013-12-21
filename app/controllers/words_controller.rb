class WordsController < ApplicationController

	def index
		@word = Word.search(params[:search])
	end

	def search
		@word = Word.search(params[:search])
			render layout: "application", template: "words/index"
	end

	def destroy
	end

end

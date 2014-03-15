class WordsController < ApplicationController

	def index
	end

	def create
		@word = Word.define(params[:search])
			render layout: "application", template: "words"
	end

	def destroy
	end

end
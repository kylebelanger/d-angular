class WordsController < ApplicationController

	def index
		@word = Word.all
	end

	def create
		@words = Word.define(params[:search])
			render layout: "application", template: "experiment"
	end

	def destroy
	end

end
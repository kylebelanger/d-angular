class WordsController < ApplicationController

	def index
	end

	def create
		@word = Word.define(params[:search])
			render layout: "application", template: "experiment"
	end

	def destroy
	end

end
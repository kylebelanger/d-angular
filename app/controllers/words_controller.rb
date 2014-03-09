class WordsController < ApplicationController

	def index
	end

	def create
		@word = Dictionary.define(params[:search])
			render layout: "application", template: "experiment"
	end

	def destroy
	end

end
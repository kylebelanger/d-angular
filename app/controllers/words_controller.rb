class WordsController < ApplicationController

	def create
		# Calls the search method to get data from API and save to local guest session
		@word = Word.search(params[:search])
	end

	def index
		#if user
			@word = Word.all
		#end
	end

	def show
	  @word = Word.find(params[:id])
	end

	def destroy
	end

end
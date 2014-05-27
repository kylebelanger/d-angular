class WordsController < ApplicationController

	def create
		# Calls search method to get data from API and save word to guest session
		@word = Word.search(params[:search])
		redirect_to words_path
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

	def new
	   @word = Word.new
	end

	def edit
	  @word = Word.find(params[:id])
	end

end
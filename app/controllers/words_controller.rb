class WordsController < ApplicationController

	def search
		@word = Word.find_or_create(params[:search])
	end

	def index
		#if user
			@word = Word.all
		#end
	end

	def show
	  @word = Word.find(params[:id])
	end

	def create
		#@words = Word.define(params[:search])
	end

	def destroy
	end

end
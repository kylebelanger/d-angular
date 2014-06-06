class WordsController < ApplicationController
	respond_to :html, :js

	def create
	  @word = Word.new(params[:word]) 
	  if @word.save
	      flash[:success] = " - Successfully created word"
		  respond_with(@word, :location => words_path)
	  else
	    render 'new'
	  end 
	end

	def index
		#if user
			@word = Word.order('created_at DESC').all
		#end
	end

	def show
	  @word = Word.find(params[:id])
	end

	def destroy
	end

	def new
	   @word = Word.new
	   respond_with(@word)
	end

	def edit
	  @word = Word.find(params[:id])
	end

end
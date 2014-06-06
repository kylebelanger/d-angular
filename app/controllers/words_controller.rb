class WordsController < ApplicationController


	def create
	  @word = Word.new(params[:word]) 
	  if @word.save
	      flash[:success] = " - Successfully created word"
	      redirect_to words_path
	  else
	    render 'new'
	  end 
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
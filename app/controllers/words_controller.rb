class WordsController < ApplicationController
  respond_to :js, :json, :html

  # GET /words
  def index
    @words = Word.order('created_at DESC').all
  end

  # Used for search form on index landing page
  def search
    @word = Word.create_words(params[:word])
    redirect_to words_path
  end

  # GET /words/1
  def show
    @word = Word.find(params[:id])
  end

  # GET /words/new
  def new
    @word = Word.new
    respond_with do |format|
      format.html { render :layout => ! request.xhr? }
    end
  end

  # GET /words/1/edit
  def edit
    @word = Word.find(params[:id])
  end

  # POST /words
  def create
    @word = Word.create(params[:word])
    respond_with(@word)   
  end

  # PUT /words/1
  def update
    @word = Word.find(params[:id])
    respond_with do |format|
      format.html{ redirect_to @word }
    end
  end

  # DELETE /words/1
  def destroy
    @word = Word.destroy(params[:id])
  end

end

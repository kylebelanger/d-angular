class WordsController < ApplicationController
  respond_to :js, :json, :html
  #respond_to :js, :only => [:create, :update, :destroy]
  # GET /words
  # GET /words.xml
  def index
    @words = Word.order('created_at DESC').all
  end

  def search
    @word = Word.create(:word => params[:word])
    redirect_to words_path
  end

  # GET /words/1
  # GET /words/1.xml
  def show
    @word = Word.find(params[:id])
  end

  # GET /words/new
  # GET /words/new.xml
  def new
    @word = Word.new
    #respond_with(@word, :layout => false)
    respond_with do |format|
      format.html { render :layout => ! request.xhr? }
    end
  end

  # GET /words/1/edit
  def edit
    @word = Word.find(params[:id])
  end

  # POST /words
  # POST /words.xml
  def create
    @word = Word.create(params[:word])
    sleep 1 if params[:pause]
    respond_with(@word)
    #redirect_to words_path unless request.xhr?
  end

  # PUT /words/1
  # PUT /words/1.xml
  def update
    @word = Word.find(params[:id])
    respond_with do |format|
      format.html{ redirect_to @word }
    end
  end

  # DELETE /words/1
  # DELETE /words/1.xml
  def destroy
    @word = Word.destroy(params[:id])
  end
end

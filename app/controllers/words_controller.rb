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
  split = Word.split_words(params[:word][:word])

   @word = split.map do |w|
     Word.create(word: w)
   end

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


    private

      def word_params
        # It's mandatory to specify the nested attributes that should be whitelisted.
        # If you use `permit` with just the key that points to the nested attributes hash,
        # it will return an empty hash.
        params.require(:word).permit(:word)
      end

end

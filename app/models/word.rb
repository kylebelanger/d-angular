class Word

  attr_accessor :search 


    def self.search(search)
     
      # determine if search has multiple words (regix = seperated by a comma, or whitespace)
      if search.match(/[\s,]+/)    
        # split and return an array of search words
        search = search.split(/[\s,]+/)
      else 
        # string to array
        search = search.split   
      end


      # create an empty response array for loop below
      response = []

      search.each do |element|
        # Get back the two hashes containing word information
        response << Wordnik.word.get_definitions(element)[0..1]
        #response << Wordnik.word.get_audio(element)[0]
      end

      # return array of hashes containing information for each word
      return response

    end  


# CONSOLE SESSION
attr_accessor :name

  def initialize(name)
    self.name = name
  end
  
  def definitions
    Wordnik.word.get_definitions(self.name)
  end

  def examples
    Wordnik.word.get_examples(self.name)
  end

  def audio
    Wordnik.word.get_audio(self.name)
  end


#CONSOLE SESSION



end
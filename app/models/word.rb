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
        # Get back the first hash containing word information
        # Without .first returns an array of hashes with multiple definitions for single word
        response << Wordnik.word.get_definitions(element)
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
#CONSOLE SESSION



end
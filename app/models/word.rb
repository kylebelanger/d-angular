class Word

  attr_accessor :search 


    def self.search(search)

      # returns an array of multiple search words if they are seperated by a comma, or whitespace
      #words = search.split(/[\s,]+/)

      # ruby for loop
      #words.each do |element|
      #    element.do_something
      #end

      # Get back an array of hashes with multiple definitions for a single word
      response = Wordnik.word.get_definitions(search)

    end  


end
class Word
  
  require 'rubygems'
  require 'json'

  attr_accessor :search 

 
  def self.search(search)

    # Get back JSON response containing array of hashes?
    response = Wordnik.word.get_definitions(search)

    # Parse JSON to an array of hashes?
    hash_result = JSON.parse(response)

    # Access first hash in the array
    #result = hash_result.first

    #words_json = JSON.parse(words_hash.to_json) 

    #return :text key of the hash
    #definition = words_json["text"].to_s

  end  

end
require 'httparty'

class Word < ActiveRecord::Base
  
  include HTTParty
  
  attr_accessible :word
  validates_uniqueness_of :word

  # Define word(s)
  def self.define(search)

    # Determine if multiple words
    if search.match(/[\s,]+/)
    	search = search.split(/[\s,]+/)	 	 # Split and return array of words
    else 
    	search = search.split              # String => array 
  	end 

  	# Array to hold response data
  	data = []

  	# Loop through word(s) and get data for each
  	search.each do |element| 
      	
        # Set variables
        base_url = "https://www.googleapis.com/scribe/v1/research?key=AIzaSyDqVYORLCUXxSv7zneerIgC2UYMnxvPeqQ&dataset=dictionary&dictionaryLanguage=en&query="

        # Get the payload
        response = HTTParty.get("#{base_url}" + "#{element}") rescue false
      	
        # Get data if response from doc
        if response != false

          # Add word to database
          term = Word.create(word: element)
      
        # Catch response errors
        else
          data["error"] = true
          data["word"] = element
        end

        # Push response to data array
      	data.push(response)
      end
    return data
  end
end

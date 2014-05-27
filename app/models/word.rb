require 'httparty'

class Word < ActiveRecord::Base
  
  attr_accessible :word
  validates_uniqueness_of :word

  # Requirements
  include HTTParty

  # Create method retrieves definition data from API and saves word to local session
  def self.search(search)

    # Local variables
    data = []
    
    # Split multiple words
    search = split_words(search)

      # Loop through word(s) 
      search.each_with_index do |element, index| 
          
        # Get data from API
        data[index] = define(element)

        # If no errors , Add word to session
        if data[index][0]["error"] != true             
          Word.create :word => element                # Add word to DB
        end
      end
  end

  # Split Words method splits words seperated by a comma or space
  def self.split_words(search)
    # Determine if multiple words
    if search.match(/[\s,]+/)
      search = search.split(/[\s,]+/)    # Split and return array of words
    else 
      search = search.split              # String => array 
    end 
  end

  # Define method gets word data from Google's API
  def self.define(word)  
    
    # Local scope varibale
    data = []

      # Set variables
      base_url = "https://www.googleapis.com/scribe/v1/research?key=AIzaSyDqVYORLCUXxSv7zneerIgC2UYMnxvPeqQ&dataset=dictionary&dictionaryLanguage=en&query="

      # Get the payload
      response = HTTParty.get("#{base_url}" + "#{word}") rescue false
      
      # Catch response errors
      if response == false
        data[0]["error"] = true
        data[0]["error"]["word"] = element
      else
        # Push response to data array
        data.push(response)
      end
    return data
  end


end
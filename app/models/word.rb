require 'httparty'

class Word < ActiveRecord::Base
  
  attr_accessible :word
  validates_uniqueness_of :word

  # Requirements
  include HTTParty

  # Find_or_Create method retrieves definition data, or hits the API to get data
  def self.find_or_create(search)
    # Local varibales
    data = []                           # Array to hold response data
    # Split multiple words
    split_words(search)

      # Loop through word(s) 
      search.each do |element| 
        if Word.exists?(word: element)
          puts "-------------------------------" 
          puts "exists in database"
        else
          # hit the API
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




  # Define word(s)
  def self.define(search)

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
          #term = Word.create(word: element)
      
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

require 'httparty'

module WordsHelper

  # Requirements
  include HTTParty

  # Define method gets word data from Google's API
  def define(word)  
    # Local scope varibale
    data = []
      # Set variables
      base_url = "https://www.googleapis.com/scribe/v1/research?key=AIzaSyDqVYORLCUXxSv7zneerIgC2UYMnxvPeqQ&dataset=dictionary&dictionaryLanguage=en&query="
      # Get the payload
      response = HTTParty.get("#{base_url}" + "#{word}")
      
      # Catch response errors
      if response["data"] == nil
        error = { error: true, word: word }
        data.push(error)        
      else
        # Push response to data array
        data.push(response)
      end
    return data
  end

end

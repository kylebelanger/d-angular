require 'httparty'
require 'active_support/inflector'


class JsonpParser < HTTParty::Parser
  SupportedFormats = {"text/javascript" => :jsonp}

  def jsonp
    # strip JSONP callback paremeters
    JSON.load(body[2..-11], nil)
  end
end


class Word

  include HTTParty
  parser JsonpParser
  attr_accessor :search 

    def self.search(search)
      
      # Determine if search has multiple words (regix = seperated by a comma, or whitespace)
      if search.match(/[\s,]+/)    
        # split and return an array of search words
        search = search.split(/[\s,]+/)
      else 
        # string to array
        search = search.split   
      end
      
      # Create empty response arrays for loop below
      response, data = [], []

      # Loop through search words and get data for each
      search.each do |element|
        
        # Get data containing word information
        data = get "http://www.google.com/dictionary/json?callback=a&sl=en&tl=en&q=#{element}"

          # Create variables for conditions below
          first_definition = data["primaries"][0]["entries"][0]["terms"][0]["text"]

          if first_definition == element.pluralize || first_definition.empty?  
            data["primaries"][0]["entries"][0]["terms"][0]["text"] = data["primaries"][0]["entries"][1]["terms"][0]["text"]
          end

        # Push data to response array
        response << data
   
      end

      # return array of hashes containing information for each word
      return response

    end  

end
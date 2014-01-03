require 'httparty'


class JsonpParser < HTTParty::Parser
  SupportedFormats = {"text/javascript" => :jsonp}

  def jsonp
    JSON.load(body[2..-11], nil)
  end

end


class Word

  include HTTParty
  parser JsonpParser
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
      data = []

      search.each do |element|
        # Get back the two hashes containing word information
        data = get "http://www.google.com/dictionary/json?callback=a&sl=en&tl=en&q=#{element}"
        response << data
      end

      # return array of hashes containing information for each word
      return response

    end  

end
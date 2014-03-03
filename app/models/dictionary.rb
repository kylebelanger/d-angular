require 'nokogiri'
require 'open-uri'

class Dictionary

  def self.define(search)

    # Determine if search has multiple words
    if search.match(/[\s,]+/)
    	search = search.split(/[\s,]+/)	 	 # Split and return array of words
    else 
    	search = search.split      			   # String => array 
  	end 

  	# Array to hold response data of hashes
  	response = []

  	# Loop through search words and get data for each
  	search.each do |element| 
      	# Load the document page, find data
      	doc = Nokogiri::HTML(open("http://www.oxforddictionaries.com/us/definition/american_english/#{element}"))

        word_data = Hash.new      
        word_data["word"] = doc.at_xpath("/html/body/div[7]/div/div[2]/article/div/div/div[1]/div[1]/div/div/header/span/span").text
        word_data["speech"] = doc.at_xpath("/html/body/div[7]/div/div[2]/article/div/div/div[1]/div[1]/div/div/div[1]/div/section[1]/h3/span").text
        word_data["definition"] = []
        word_data["example"] = []

        # Set definition variables
        definition_one = doc.at_xpath("/html/body/div[7]/div/div[2]/article/div/div/div[1]/div[1]/div/div/div[1]/div/section[1]/ul/li/div/span[1]").text
        definition_two = doc.at_xpath("/html/body/div[7]/div/div[2]/article/div/div/div[1]/div[1]/div/div/div[1]/div/section[1]/ul[1]/li/div/span[2]").text rescue false
        definition_three = doc.at_xpath("/html/body/div[7]/div/div[2]/article/div/div/div[1]/div[1]/div/div/div[1]/div/section[1]/ul[2]/li[1]/div/span[2]").text rescue false
        example_one = doc.at_xpath("/html/body/div[7]/div/div[2]/article/div/div/div[1]/div[1]/div/div/div[1]/div/section[1]/ul/li/div/span[2]/em").text rescue false
        example_two = doc.at_xpath("/html/body/div[7]/div/div[2]/article/div/div/div[1]/div[1]/div/div/div[1]/div/section[1]/ul[1]/li/div/span[3]/em").text rescue false
        example_three = doc.at_xpath("/html/body/div[7]/div/div[2]/article/div/div/div[1]/div[1]/div/div/div[1]/div/section[1]/ul[2]/li/div/span[3]/em").text rescue false

        if definition_one != "1"
          word_data["definition"][0] = definition_one
          word_data["example"][0] = example_one
        elsif (definition_two rescue false) != false
          word_data["definition"][0] = definition_two
          word_data["example"][0] = example_two
            if (definition_three rescue false) != false
              word_data["definition"][1] = definition_three
              word_data["example"][1] = example_three
            end
        end

      	response.push(word_data)
      end
    return response
  end
end



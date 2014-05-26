require 'httparty'

class Word < ActiveRecord::Base
  
  has_many :definitions
  attr_accessible :word
  validates_uniqueness_of :word

  # Requirements
  include HTTParty

  # Find_or_Create method retrieves definition data, or hits the API to get data
  def self.find_or_create(search)
    # Split multiple words
    search = split_words(search)

      # Loop through word(s) 
      search.each do |element| 
        if Word.exists?(word: element)
          #return word and data
          puts "#{element} exists in database"
        else
          # hit the API, and add to DB
          Word.create :word => element
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


end
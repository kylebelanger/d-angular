class Word < ActiveRecord::Base
  
  attr_accessible :word
  validates_uniqueness_of :word

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
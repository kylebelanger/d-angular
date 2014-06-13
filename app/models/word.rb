  class Word < ActiveRecord::Base
    
    attr_accessible :word
    validates_uniqueness_of :word

    # Used for creating multiple words on landing page
    def self.create_words(word)
      split = split_words(word)

      split.each do |w|
        Word.create :word => w
        #puts w
      end
    end

    # Split Words method splits words seperated by a comma or space
    def self.split_words(word)
      word = word.split

      word.each do |w|
        w = w.gsub!(",", "")
      end
    end

  end
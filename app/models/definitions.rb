class Definitions < ActiveRecord::Base
  belongs_to :word
  attr_accessible :text
end

class List < ActiveRecord::Base
	belongs_to :user
	belongs_to :word

  attr_accessible :description, :name
end

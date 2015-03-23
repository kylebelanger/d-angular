class User < ActiveRecord::Base
	has_many :lists, dependent: :destroy
	has_many :words, through: :lists
end

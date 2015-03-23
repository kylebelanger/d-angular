class List < ActiveRecord::Base
	has_many :words, dependent: :delete_all
end

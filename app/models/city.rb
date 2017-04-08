class City < ApplicationRecord

	has_many :store

	name_regex = /\A[ a-zA-Z.']+\z/

	validates :name,
			  :presence => true,
			  :length => {maximum: 50},
			  :format => {with: name_regex}

end

class Store < ApplicationRecord

    belongs_to :city

    name_regex = /\A[ a-zA-Z.']+\z/

    validates_presence_of :name, :address, :pin, :phone, :website, :tags, :city_id

    validates :name,
              :length => {maximum: 50},
              :format => {with: name_regex}

    validates :pin,
              :length => {is: 6, :message => "Pin should be of 6 digit length"},
              :numericality => {:only_integer => true, :message => "Pin should contain number only "}


    validates :phone,
              :length => {is: 10, :message => "Phone Number should be of 10 digit long"},
              :numericality => {:only_integer => true, :message => "Pin should contain number only "}

    def self.search(search)
         where("name LIKE ? or pin LIKE ? or tags LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    end

end

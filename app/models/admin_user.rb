class AdminUser < ApplicationRecord
    has_secure_password

    email_regex = /\A[a-zA-Z\d]+([.][a-zA-Z\d]+)*[@]+[a-zA-Z\d]+([.][a-zA-Z\d]+){1,3}+\z/
    name_regex = /\A[ a-zA-Z.']+\z/

    # validates_presence_of :name, :email, :confirm_email, :password, :confirm_password

    validates :name,
              :length => {maximum: 50},
              :format => {with: name_regex}

    validates :email,
              :length => {:maximum => 50},
              :uniqueness => true,
              :format => {with: email_regex}

end

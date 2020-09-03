class User < ActiveRecord::Base
    has_many :drink
    has_secure_password 



end 
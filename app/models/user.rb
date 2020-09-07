class User < ActiveRecord::Base
    has_many :drinks
    has_secure_password 
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :birthday, presence: true
    validates :user_name, presence: true, uniqueness: true 
    validates :phone_number, presence: true
    validates :password, presence: true



end 
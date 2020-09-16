
class Drink < ActiveRecord::Base 
    belongs_to :user
    validates :drink_name, presence: true
    validates :temperature, presence: true
    validates :caffeine_type, presence: true
    validates :milk_options, presence: true
    validates :flavors, presence: true
    

end 